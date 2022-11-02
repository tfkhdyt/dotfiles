---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
version = '0.20.0'
---@diagnostic enable

local home = os.getenv("HOME")
package.path = home
.. "/.config/xplr/plugins/?/init.lua;"
.. home
.. "/.config/xplr/plugins/?.lua;"
.. package.path

require("xclip").setup()
require"icons".setup()
require("dual-pane").setup()
require("alacritty").setup()
require("fzf").setup()
require("trash-cli").setup()
require("ouch").setup()
require("map").setup()

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

