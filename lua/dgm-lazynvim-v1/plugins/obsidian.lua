return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal",
      },
      {
        name = "work",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/work",
      },
    },

    -- see below for full list of options 👇
  },

    config = function ()
        local obs = require("obsidian")
        obs.setup({

          -- A list of workspace names, paths, and configuration overrides.
          -- If you use the Obsidian app, the 'path' of a workspace should generally be
          -- your vault root (where the `.obsidian` folder is located).
          -- When obsidian.nvim is loaded by your plugin manager, it will automatically set
          -- the workspace to the first workspace in the list whose `path` is a parent of the
          -- current markdown file being edited.
          workspaces = {
                {
                  name = "work",
                  path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/work",
                  -- Optional, override certain settings.
                  overrides = {
                    notes_subdir = "notes",
                    template =  "Daily Template"
                  },
                },
                {
                  name = "personal",
                  path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal",
                },
            },

            -- Where to put new notes. Valid options are
            --  * "current_dir" - put new notes in same directory as the current buffer.
            --  * "notes_subdir" - put new notes in the default notes subdirectory.
            new_notes_location = "notes_subdir",

            -- Optional, customize how note IDs are generated given an optional title.
            ----@param title string|?
            ----@return string
            note_id_func = function(title)
                -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                -- In this case a note with the title 'My new note' will be given an ID that looks
                -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                local suffix = ""
                if title ~= nil then
                -- If title is given, transform it into valid file name.
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                -- If title is nil, just add 4 random uppercase letters to the suffix.
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
                end
                return tostring(os.time()) .. "-" .. suffix
            end,

            -- Optional, customize how note file names are generated given the ID, target directory, and title.
            ----@param spec { id: string, dir: obsidian.Path, title: string|? }
            ----@return string|obsidian.Path The full path to the new note.
            note_path_func = function(spec)
                -- This is equivalent to the default behavior.
                local path = spec.dir / tostring(spec.id)
                return path:with_suffix(".md")
            end,

            -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
            -- URL it will be ignored but you can customize this behavior here.
            ----@param url string
            follow_url_func = function(url)
                -- Open the URL in the default web browser.
                vim.fn.jobstart({"open", url})  -- Mac OS
                -- vim.fn.jobstart({"xdg-open", url})  -- linux
            end,

            -- Optional, set to true if you use the Obsidian Advanced URI plugin.
            -- https://github.com/Vinzent03/obsidian-advanced-uri
            use_advanced_uri = false,

            -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
            open_app_foreground = false,

            -- Optional, boolean or a function that takes a filename and returns a boolean.
            -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
            disable_frontmatter = false,

            -- Optional, alternatively you can customize the frontmatter data.
            ---@return table
            note_frontmatter_func = function(note)
                -- Add the title of the note as an alias.
                if note.title then
                    note:add_alias(note.title)
                end

                local out = { title = note.id, aliases = note.aliases, tags = note.tags }

                -- `note.metadata` contains any manually added fields in the frontmatter.
                -- So here we just make sure those fields are kept in the frontmatter.
                if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end

                return out
            end,

            -- Optional, for templates (see below).
            templates = {
              subdir = "templates",
              date_format = "%Y-%m-%d",
              time_format = "%H:%M",
              -- A map for custom variables, the key should be the variable and the value a function
              substitutions = {},
            },

            picker = {
                -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
                name = "telescope.nvim",
                -- Optional, configure key mappings for the picker. These are the defaults.
                -- Not all pickers support all mappings.
                mappings = {
                -- Create a new note from your query.
                new = "<C-x>",
                -- Insert a link to the selected note.
                insert_link = "<C-l>",
                },
            },
        })

        vim.opt.conceallevel = 1
    end
}

