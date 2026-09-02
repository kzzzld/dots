#!/usr/bin/env bash
# vim: foldmethod=marker
set -e

# Set dotfile directory
DOTDIR="${HOME}/Dotfiles"

if [ ! -d "${DOTDIR}" ]; then
  if [ "$(whoami)" == "kzzzl" ]; then
    git clone git@github.com:kzzzld/macdots.git "${DOTDIR}" # if your name is kzzzl, I think you can use ssh :)
  else
    git clone https://github.com/kzzzld/macdots.git "${DOTDIR}"
  fi
fi

# (macOS) homebrew {{{
if [[ $OSTYPE == "darwin"* ]]; then
  if ! command -v brew >/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if ! grep -q '/opt/homebrew/bin/brew shellenv' ~/.zprofile 2>/dev/null; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >>~/.zprofile
  fi
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"

  # Install Brew packages
  (
    cd "${DOTDIR}"
    brew bundle
  )
fi
# }}}

# (macOS) defaults {{{
if [[ "$OSTYPE" = "darwin"* ]]; then
  ANIMATIONS="true"

  # Global Settings
  defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
  defaults write NSGlobalDomain AppleShowAllExtensions -bool false
  defaults write NSGlobalDomain NSWindowResizeTime -float 1
  defaults write -g com.apple.swipescrolldirection -bool false
  defaults write -g NSSplitViewItemSidebarDefaultsToFloatingAppearance -bool false

  if [ "$ANIMATIONS" == "true" ]; then
    defaults delete -g NSAutomaticWindowAnimationsEnabled || true
    defaults delete -g NSBrowserColumnAnimationSpeedMultiplier || true
    defaults delete -g NSDocumentRevisionsWindowTransformAnimation || true
    defaults delete -g QLPanelAnimationDuration || true
    defaults delete -g NSScrollAnimationEnabled || true
    defaults delete -g NSScrollViewRubberbanding || true
    defaults delete -g NSToolbarFullScreenAnimationDuration || true
    defaults delete com.apple.finder DisableAllAnimations || true
    defaults write com.apple.dock autohide-delay -float 0.0
    defaults write com.apple.dock autohide-time-modifier -float 0.4
    defaults delete com.apple.dock expose-animation-duration || true
  else
    defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
    defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
    defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
    defaults write -g QLPanelAnimationDuration -float 0
    defaults write -g NSScrollAnimationEnabled -bool false
    defaults write -g NSScrollViewRubberbanding -bool false
    defaults write -g NSToolbarFullScreenAnimationDuration -float 0
    defaults write com.apple.finder DisableAllAnimations -bool true
    defaults write com.apple.dock autohide-delay -float 0
    defaults write com.apple.dock autohide-time-modifier -float 0
    defaults write com.apple.dock expose-animation-duration -float 0.1
  fi

  desktoppr "$HOME/Wallpapers/dark-forest.jpg"

  # Trackpad
  defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0

  # Finder
  defaults write com.apple.finder AppleShowAllFiles -bool "false"
  defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false
  defaults write com.apple.finder CreateDesktop -bool false
  defaults write com.apple.WindowManager StandardHideWidgets -int 1

  # Dock
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock show-recents -bool false

  # Menu bar
  defaults -currentHost write com.apple.controlcenter.plist BatteryShowPercentage -bool true

  # Holy Emacs!!!
  defaults write org.gnu.Emacs TransparentTitleBar DARK
fi
# }}}

# (macOS) übersicht {{{
if [[ "$OSTYPE" = "darwin"* ]]; then
  [ ! -d "$HOME/Library/Application Support/Übersicht/widgets/simple-bar" ] && git clone --depth 1 https://github.com/Jean-Tinland/simple-bar $HOME/Library/Application\ Support/Übersicht/widgets/simple-bar
fi
# }}}

# (all) stow {{{
(
  cd $DOTDIR
  stow common
  [[ "$OSTYPE" = "darwin"* ]] && stow macos
)
# }}}
