# rustup
complete -c rustup -d "The Rust toolchain installer"
complete -xc rustup -s v -l verbose -d "Enable verbose output"
complete -xc rustup -s h -l help -d "Prints help information"
complete -xc rustup -s V -l version -d "Prints version information"

set __fish_rustup_subcommands \
  show update default toolchain target override run \
  which doc self telemetry "set" "help"

complete -c rustup -xn '__fish_use_subcommand' -a '$__fish_rustup_subcommands'
complete -c rustup -xn '__fish_seen_subcommand_from help' -a '$__fish_rustup_subcommands'


for sub in update default;
  complete -c rustup -xn "__fish_seen_subcommand_from $sub" -a 'beta nightly stable'
end

complete -c rustup -xn "__fish_seen_subcommand_from toolchain" -a 'list install uninstall link help'
