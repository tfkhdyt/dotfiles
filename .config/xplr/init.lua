---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
version = '0.20.0'
---@diagnostic enable

local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = home
.. "/.config/xplr/plugins/?/init.lua;"
.. home
.. "/.config/xplr/plugins/?.lua;"
.. xpm_path
.. "/?.lua;"
.. xpm_path
.. "/?/init.lua;"
.. package.path

os.execute(
  string.format(
    "[ -e '%s' ] || git clone '%s' '%s'",
    xpm_path,
    xpm_url,
    xpm_path
  )
)

require("xclip").setup()
require"icons".setup()
require("dual-pane").setup()
require("alacritty").setup()
require("fzf").setup()
require("trash-cli").setup()
require("ouch").setup()
require("map").setup()
require("xpm").setup({
  plugins = {
    -- Let xpm manage itself
    'dtomvan/xpm.xplr',
    'Junker/nuke.xplr'
  },
  auto_install = true,
  auto_cleanup = true,
})
require("nuke").setup{
  pager = "less -R", -- default: less -R
  open = {
    run_executables = true, -- default: false
    custom = {
      -- {extension = "image", command = "sxiv {}"},
      {mime = "application/pdf", command = "okular {} &"},
      {extension = "md", command = "ghostwriter {} &"},
      {mime_regex = "^image/.*", command = "ristretto {} &"},
      {mime_regex = "^video/.*", command = "mpv --no-terminal {} &"},
      {mime_regex = "^audio/.*", command = "mpv --no-terminal {} &"},
      {mime_regex = ".*", command = "xdg-open {} &"}
    }
  },
  view = {
    show_line_numbers = true, -- default: false
  },
  smart_view = {
    custom = {
      {extension = "so", command = "ldd -r {} | less"},
    }
  }
}

local key = xplr.config.modes.builtin.default.key_bindings.on_key

key.v = {
  help = "nuke",
  messages = {"PopMode", {SwitchModeCustom = "nuke"}}
}
key["f3"] = xplr.config.modes.custom.nuke.key_bindings.on_key.v
key["enter"] = xplr.config.modes.custom.nuke.key_bindings.on_key.o

xplr.config.modes.builtin.action.key_bindings.on_key["!"].messages = {
  { Call = { command = "zsh", args = { "-i" } } },
  "ExplorePwdAsync",
  "PopMode",
}

local colors = {
  blue = { Rgb = { 138, 173, 244 } },
  pink = { Rgb = { 137, 180, 250 } },
  magenta = { Rgb = { 245, 194, 231 } },
  teal = { Rgb = { 148, 226, 213 } },
  yellow = { Rgb = { 238, 212, 159 } }
}

xplr.config.general.focus_ui.prefix = "["
xplr.config.general.focus_ui.style.fg = colors.yellow
xplr.config.node_types.directory.style.fg = colors.pink
xplr.config.node_types.symlink.style.fg = colors.teal
xplr.config.node_types.symlink.style.add_modifiers = { "Bold" }
xplr.config.node_types.mime_essence = {
  video = {
    -- application/*
    ["*"] = { meta = { icon = "" }, style = { fg = colors.magenta } }
  },
  audio = {
    ["*"] = { meta = { icon = "" }, style = { fg = colors.teal } }
  },
  image = {
    ["*"] = { meta = { icon = "" } }
  },
  application = {
    ["pdf"] = { meta = { icon = "" }, style = { fg = colors.blue } },
    ["vnd.openxmlformats-officedocument.wordprocessingml.document"] = { meta = { icon = "" }, style = { fg = colors.blue } }
  },

}

xplr.config.modes.builtin.go_to = {
  name = "go to",
  key_bindings = {
    on_key = {
      ["f"] = {
        help = "follow symlink",
        messages = {
          "FollowSymlink",
          "PopMode",
        },
      },
      ["g"] = {
        help = "top",
        messages = {
          "FocusFirst",
          "PopMode",
        },
      },
      ["p"] = {
        help = "path",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "go_to_path" },
          { SetInputBuffer = "" },
        },
      },
      ["i"] = {
        help = "initial $PWD",
        messages = {
          "PopMode",
          {
            BashExecSilently0 = [===[
              "$XPLR" -m 'ChangeDirectory: %q' "${XPLR_INITIAL_PWD:?}"
            ]===],
          },
        },
      },
      ["x"] = {
        help = "open in gui",
        messages = {
          {
            BashExecSilently0 = [===[
              if [ -z "$OPENER" ]; then
                if command -v xdg-open; then
                  OPENER="xdg-open"
                elif command -v open; then
                  OPENER=open
                else
                  "$XPLR" -m 'LogError: "$OPENER not found"'
                  exit 1
                fi
              fi
              (while IFS= read -r -d '' PTH; do
                $OPENER "${PTH:?}" > /dev/null 2>&1 &
                disown
              done < "${XPLR_PIPE_RESULT_OUT:?}")
            ]===],
          },
          "ClearScreen",
          "PopMode",
        },
      },
    },
  },
}


-- The builtin create directory mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.create_directory = {
  name = "create directory",
  prompt = " ❯ ",
  key_bindings = {
    on_key = {
      ["tab"] = {
        help = "try complete",
        messages = {
          { CallLuaSilently = "builtin.try_complete_path" },
        },
      },
      ["enter"] = {
        help = "submit",
        messages = {
          {
            BashExecSilently0 = [===[
              PTH="$XPLR_INPUT_BUFFER"
              PTH_ESC=$(printf %q "$PTH")
              if [ "$PTH" ]; then
                mkdir -p -- "$PTH" \
                && "$XPLR" -m 'SetInputBuffer: ""' \
                && "$XPLR" -m ExplorePwd \
                && "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC created" \
                && "$XPLR" -m 'FocusPath: %q' "$PTH"
              else
                "$XPLR" -m PopMode
              fi
            ]===],
          },
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}

-- The builtin create file mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.create_file = {
  name = "create file",
  prompt = " ❯ ",
  key_bindings = {
    on_key = {
      ["tab"] = {
        help = "try complete",
        messages = {
          { CallLuaSilently = "builtin.try_complete_path" },
        },
      },
      ["enter"] = {
        help = "submit",
        messages = {
          {
            BashExecSilently0 = [===[
              PTH="$XPLR_INPUT_BUFFER"
              PTH_ESC=$(printf %q "$PTH")
              if [ "$PTH" ]; then
                mkdir -p -- "$(dirname $PTH)" \
                && touch -- "$PTH" \
                && "$XPLR" -m 'SetInputBuffer: ""' \
                && "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC created" \
                && "$XPLR" -m 'ExplorePwd' \
                && "$XPLR" -m 'FocusPath: %q' "$PTH"
              else
                "$XPLR" -m PopMode
              fi
            ]===],
          },
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}

-- The builtin quit mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.quit = {
  name = "quit",
  key_bindings = {
    on_key = {
      -- ["enter"] = {
      --   help = "just quit",
      --   messages = {
      --     "Quit",
      --   },
      -- },
      ["p"] = {
        help = "quit printing pwd",
        messages = {
          "PrintPwdAndQuit",
        },
      },
      ["f"] = {
        help = "quit printing focus",
        messages = {
          "PrintFocusPathAndQuit",
        },
      },
      ["s"] = {
        help = "quit printing selection",
        messages = {
          "PrintSelectionAndQuit",
        },
      },
      ["r"] = {
        help = "quit printing result",
        messages = {
          "PrintResultAndQuit",
        },
      },
    },
  },
}
