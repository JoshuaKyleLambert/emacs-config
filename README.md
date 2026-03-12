# Emacs Configuration

Personal Emacs setup with a modular `lisp/` layout, centered on Clojure + CIDER workflow, completion UX, and practical defaults.

## Quick Start

1. Clone into `~/.emacs.d`.
2. Start Emacs.
3. Let `use-package` install missing packages automatically.

If package metadata is stale: `M-x package-refresh-contents`.

## Layout

Main entrypoint: `init.el`  
Module directory: `lisp/`

Current load order from `init.el`:

1. `core.el`
2. `ui.el`
3. `completion.el`
4. `window.el`
5. `lsp.el`
6. `clojure.el`
7. `repl.el`
8. `tramp-config.el`
9. `which-key-config.el`
10. `ai.el`
11. `my-treesitter-config.el`
12. `flycheck-config.el`
13. `magit-config.el`
14. `keybindings.el`

## Module Guide (`lisp/`)

- `core.el`: package archives, `use-package` bootstrap, auto-revert, autosave/backup paths.
- `ui.el`: theme/modeline/icons, startup UI defaults, line numbers, recent files, font selection.
- `completion.el`: `vertico`, `orderless`, `marginalia`, `consult`, and `company`.
- `window.el`: `windmove` keyboard window navigation.
- `lsp.el`: `lsp-mode`, `lsp-ui`, `lsp-treemacs`, `treemacs`; sets Clojure LSP command.
- `clojure.el`: tree-sitter Clojure mode mapping, smartparens, Clojure editing defaults.
- `repl.el`: CIDER config and REPL-related keybindings.
- `flycheck-config.el`: `flycheck` + `flycheck-clj-kondo`.
- `magit-config.el`: Magit plus `diff-hl`.
- `tramp-config.el`: TRAMP SSH defaults and connection performance options.
- `which-key-config.el`: which-key popup behavior.
- `ai.el`: `gptel` setup and default model.
- `my-treesitter-config.el`: tree-sitter install behavior (`treesit-auto-install`).
- `keybindings.el`: global keybindings (Magit + AI helpers).

## Dependencies

Expected system tools:

- `git`
- `clojure` (CLI)
- `clj-kondo` (for Clojure linting in Flycheck)
- `clojure-lsp` (if using `lsp-mode` features)

## Installing On A New Machine

1. Install required system tools:
   - `git`
   - `clojure`
   - `clj-kondo`
   - `clojure-lsp` (recommended if you use LSP features)
2. Clone this config into `~/.emacs.d`:
   - `git clone <repo> ~/.emacs.d`
3. Start Emacs.
4. If package metadata is stale, run:
   - `M-x package-refresh-contents`
5. Restart Emacs if needed after first-time package installs.

Most missing Emacs packages are installed automatically via `use-package`.

## clj-kondo Setup

`clj-kondo` is a separate system binary (not an Emacs package), so install it on each machine.

Install (official script):

```bash
bash <(curl -s https://raw.githubusercontent.com/clj-kondo/clj-kondo/master/script/install-clj-kondo)
```

Verify in terminal:

```bash
clj-kondo --version
```

Verify from Emacs:

- `M-x flycheck-verify-setup`
- In a Clojure buffer, confirm `clj-kondo-clj` is selected.

## Bootstrap Check

After first setup on a new machine, run these checks.

Terminal:

```bash
clojure --version
clj-kondo --version
clojure-lsp --version
```

In Emacs:

1. Open any `.clj` file and confirm it opens in Clojure mode (tree-sitter mode if available).
2. Run `M-x flycheck-verify-setup` and confirm `clj-kondo-clj` is active.
3. Run `M-x cider-jack-in-clj` to verify REPL startup.
4. If using LSP, run `M-x lsp` in a Clojure buffer and confirm diagnostics/navigation are available.

## Clojure Workflow

- Start REPL: `M-x cider-jack-in-clj`
- Eval buffer: `C-c e`
- Refresh namespaces: `C-c r`
- Structural edit:
  - slurp: `C-c s`
  - barf: `C-c b`

Notes:

- `cider-clojure-cli-aliases` is set to `:dev`.
- Tree-sitter is used when available; fallback mode associations are still present.

## Keybindings

- `C-x g`: `magit-status`
- `C-c a a`: open `gptel`
- `C-c a r`: send selected region to `gptel`
- `C-c r`: `cider-refresh`
- `C-c e`: `cider-eval-buffer`

## Remote Editing

TRAMP is configured for SSH with control master options and a short connection timeout for snappier remote sessions.

## Customization

User-generated Custom UI settings are stored in `custom.el` and loaded from `init.el`.

## Author

Joshua Lambert
