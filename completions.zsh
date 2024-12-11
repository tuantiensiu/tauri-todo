
> mytodo@0.1.0 tauri
> tauri completions --shell zsh

#compdef cargo

autoload -U is-at-least

_cargo() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_cargo_commands" \
"*::: :->cargo" \
&& ret=0
    case $state in
    (cargo)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:cargo-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'-A+[Name of your Tauri application]:APP_NAME: ' \
'--app-name=[Name of your Tauri application]:APP_NAME: ' \
'-W+[Window title of your Tauri application]:WINDOW_TITLE: ' \
'--window-title=[Window title of your Tauri application]:WINDOW_TITLE: ' \
'-D+[Web assets location, relative to <project-dir>/src-tauri]:FRONTEND_DIST: ' \
'--frontend-dist=[Web assets location, relative to <project-dir>/src-tauri]:FRONTEND_DIST: ' \
'-P+[Url of your dev server]:DEV_URL: ' \
'--dev-url=[Url of your dev server]:DEV_URL: ' \
'--before-dev-command=[A shell command to run before \`tauri dev\` kicks in]:BEFORE_DEV_COMMAND: ' \
'--before-build-command=[A shell command to run before \`tauri build\` kicks in]:BEFORE_BUILD_COMMAND: ' \
'--ci[Skip prompting for values]' \
'-f[Force init to overwrite the src-tauri folder]' \
'--force[Force init to overwrite the src-tauri folder]' \
'-l[Enables logging]' \
'--log[Enables logging]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
'-r+[Binary to use to run the application]:RUNNER: ' \
'--runner=[Binary to use to run the application]:RUNNER: ' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--port=[Specify port for the built-in dev server for static files. Defaults to 1430]:PORT: ' \
'-e[Exit on panic]' \
'--exit-on-panic[Exit on panic]' \
'--release[Run the code in release mode]' \
'--no-dev-server-wait[Skip waiting for the frontend dev server to start before building the tauri application]' \
'--no-watch[Disable the file watcher]' \
'--no-dev-server[Disable the built-in dev server for static files]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'*::args -- Command line arguments passed to the runner. Use `--` to explicitly mark the start of the arguments. Arguments after a second `--` are passed to the application e.g. `tauri dev -- \[runnerArgs\] -- \[appArgs\]`:' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
'-r+[Binary to use to build the application, defaults to \`cargo\`]:RUNNER: ' \
'--runner=[Binary to use to build the application, defaults to \`cargo\`]:RUNNER: ' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'*-f+[Space or comma separated list of features to activate]' \
'*--features=[Space or comma separated list of features to activate]' \
'*-b+[Space or comma separated list of bundles to package]' \
'*--bundles=[Space or comma separated list of bundles to package]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--no-bundle[Skip the bundling step even if \`bundle > active\` is \`true\` in tauri config]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'*::args -- Command line arguments passed to the runner. Use `--` to explicitly mark the start of the arguments:' \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
'*-b+[Space or comma separated list of bundles to package]' \
'*--bundles=[Space or comma separated list of bundles to package]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'*-f+[Space or comma separated list of features, should be the same features passed to \`tauri build\` if any]' \
'*--features=[Space or comma separated list of features, should be the same features passed to \`tauri build\` if any]' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'--ci[Skip prompting for values]' \
'--skip-targets-install[Skips installing rust toolchains via rustup]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--host=[Use the public network address for the development server. If an actual address it provided, it is used instead of prompting to pick one]' \
'--port=[Specify port for the built-in dev server for static files. Defaults to 1430]:PORT: ' \
'-e[Exit on panic]' \
'--exit-on-panic[Exit on panic]' \
'--release[Run the code in release mode]' \
'--no-dev-server-wait[Skip waiting for the frontend dev server to start before building the tauri application]' \
'--no-watch[Disable the file watcher]' \
'-o[Open Android Studio instead of trying to run on a connected device]' \
'--open[Open Android Studio instead of trying to run on a connected device]' \
'--force-ip-prompt[Force prompting for an IP to use to connect to the dev server on mobile]' \
'--no-dev-server[Disable the built-in dev server for static files]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::device -- Runs on the given device name:' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
'*-t+[Which targets to build (all by default)]' \
'*--target=[Which targets to build (all by default)]' \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--split-per-abi[Whether to split the APKs and AABs per ABIs]' \
'--apk[Build APKs]' \
'--aab[Build AABs]' \
'-o[Open Android Studio]' \
'--open[Open Android Studio]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
'*-t+[Targets to build]' \
'*--target=[Targets to build]' \
'-r[Builds with the release flag]' \
'--release[Builds with the release flag]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__android__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-android-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
'--interactive[Interactive mode to apply automatic fixes]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'-t+[Git tag to use]:TAG: ' \
'--tag=[Git tag to use]:TAG: ' \
'-r+[Git rev to use]:REV: ' \
'--rev=[Git rev to use]:REV: ' \
'-b+[Git branch to use]:BRANCH: ' \
'--branch=[Git branch to use]:BRANCH: ' \
'--no-fmt[Don'\''t format code with rustfmt]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':plugin -- The plugin to add:' \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-a+[Author name]:AUTHOR: ' \
'--author=[Author name]:AUTHOR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--no-api[Initializes a Tauri plugin without the TypeScript API]' \
'--no-example[Initialize without an example project]' \
'--android[Whether to initialize an Android project for the plugin]' \
'--ios[Whether to initialize an iOS project for the plugin]' \
'--mobile[Whether to initialize Android and iOS projects for the plugin]' \
'--github-workflows[Generate github workflows]' \
'--tauri[Initializes a Tauri core plugin (internal usage)]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
':plugin_name -- Name of your Tauri plugin:' \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-a+[Author name]:AUTHOR: ' \
'--author=[Author name]:AUTHOR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--no-api[Initializes a Tauri plugin without the TypeScript API]' \
'--no-example[Initialize without an example project]' \
'--android[Whether to initialize an Android project for the plugin]' \
'--ios[Whether to initialize an iOS project for the plugin]' \
'--mobile[Whether to initialize Android and iOS projects for the plugin]' \
'--github-workflows[Generate github workflows]' \
'--tauri[Initializes a Tauri core plugin (internal usage)]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-o+[The output directory]:OUT_DIR: ' \
'--out-dir=[The output directory]:OUT_DIR: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. Must match the current plugin'\''s name. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__android__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-android-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-o+[The output directory]:OUT_DIR: ' \
'--out-dir=[The output directory]:OUT_DIR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. Must match the current plugin'\''s name. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__ios__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-ios-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
'-o+[Output directory. Default\: '\''icons'\'' directory next to the tauri.conf.json file]:OUTPUT:_files' \
'--output=[Output directory. Default\: '\''icons'\'' directory next to the tauri.conf.json file]:OUTPUT:_files' \
'*-p+[Custom PNG icon sizes to generate. When set, the default icons are not generated]:PNG: ' \
'*--png=[Custom PNG icon sizes to generate. When set, the default icons are not generated]:PNG: ' \
'--ios-color=[The background color of the iOS icon - string as defined in the W3C'\''s CSS Color Module Level 4 <https\://www.w3.org/TR/css-color-4/>]:IOS_COLOR: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::input -- Path to the source icon (squared PNG or SVG file with transparency):_files' \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
'(-f --private-key-path)-k+[Load the private key from a string]:PRIVATE_KEY: ' \
'(-f --private-key-path)--private-key=[Load the private key from a string]:PRIVATE_KEY: ' \
'(-k --private-key)-f+[Load the private key from a file]:PRIVATE_KEY_PATH:_files' \
'(-k --private-key)--private-key-path=[Load the private key from a file]:PRIVATE_KEY_PATH:_files' \
'-p+[Set private key password when signing]:PASSWORD: ' \
'--password=[Set private key password when signing]:PASSWORD: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':file -- Sign the specified file:_files' \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
'-p+[Set private key password when signing]:PASSWORD: ' \
'--password=[Set private key password when signing]:PASSWORD: ' \
'-w+[Write private key to a file]:WRITE_KEYS:_files' \
'--write-keys=[Write private key to a file]:WRITE_KEYS:_files' \
'-f[Overwrite private key even if it exists on the specified path]' \
'--force[Overwrite private key even if it exists on the specified path]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__signer__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-signer-help-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
'-s+[Shell to generate a completion script for.]:SHELL:(bash elvish fish powershell zsh)' \
'--shell=[Shell to generate a completion script for.]:SHELL:(bash elvish fish powershell zsh)' \
'-o+[Output file for the shell completions. By default the completions are printed to stdout]:OUTPUT:_files' \
'--output=[Output file for the shell completions. By default the completions are printed to stdout]:OUTPUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'--description=[Permission description]:DESCRIPTION: ' \
'*-a+[List of commands to allow]:ALLOW: ' \
'*--allow=[List of commands to allow]:ALLOW: ' \
'*-d+[List of commands to deny]:DENY: ' \
'*--deny=[List of commands to deny]:DENY: ' \
'--format=[Output file format]:FORMAT:(json toml)' \
'-o+[The output file]:OUT:_files' \
'--out=[The output file]:OUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::identifier -- Permission identifier:' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':identifier -- Permission to add:' \
'::capability -- Capability to add the permission to:' \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':identifier -- Permission to remove:' \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
'-f+[Permission identifier filter]:FILTER: ' \
'--filter=[Permission identifier filter]:FILTER: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin -- Name of the plugin to list permissions:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__permission__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-permission-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'--description=[Capability description]:DESCRIPTION: ' \
'*--windows=[Capability windows]:WINDOWS: ' \
'*--permission=[Capability permissions]:PERMISSION: ' \
'--format=[Output file format]:FORMAT:(json toml)' \
'-o+[The output file]:OUT:_files' \
'--out=[The output file]:OUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::identifier -- Capability identifier:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__capability__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-capability-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__inspect__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-inspect-help-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_cargo__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:cargo-help-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
":: :_cargo__help__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:cargo-help-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_cargo__help__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:cargo-help-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_cargo__help__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:cargo-help-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_cargo__help__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:cargo-help-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_cargo__help__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:cargo-help-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_cargo__help__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:cargo-help-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_cargo__help__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:cargo-help-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_cargo__help__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:cargo-help-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_cargo__help__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:cargo-help-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_cargo_commands] )) ||
_cargo_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'cargo commands' commands "$@"
}
(( $+functions[_cargo__help_commands] )) ||
_cargo__help_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'cargo help commands' commands "$@"
}
(( $+functions[_cargo__help__help_commands] )) ||
_cargo__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help help commands' commands "$@"
}
(( $+functions[_cargo__help__tauri_commands] )) ||
_cargo__help__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
    )
    _describe -t commands 'cargo help tauri commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__add_commands] )) ||
_cargo__help__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri add commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__android_commands] )) ||
_cargo__help__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'cargo help tauri android commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__android__android-studio-script_commands] )) ||
_cargo__help__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__android__build_commands] )) ||
_cargo__help__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri android build commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__android__dev_commands] )) ||
_cargo__help__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri android dev commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__android__init_commands] )) ||
_cargo__help__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri android init commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__build_commands] )) ||
_cargo__help__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri build commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__bundle_commands] )) ||
_cargo__help__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri bundle commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__capability_commands] )) ||
_cargo__help__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'cargo help tauri capability commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__capability__new_commands] )) ||
_cargo__help__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri capability new commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__completions_commands] )) ||
_cargo__help__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri completions commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__dev_commands] )) ||
_cargo__help__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri dev commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__icon_commands] )) ||
_cargo__help__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri icon commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__info_commands] )) ||
_cargo__help__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri info commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__init_commands] )) ||
_cargo__help__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri init commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__inspect_commands] )) ||
_cargo__help__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'cargo help tauri inspect commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__inspect__wix-upgrade-code_commands] )) ||
_cargo__help__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__migrate_commands] )) ||
_cargo__help__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri migrate commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__permission_commands] )) ||
_cargo__help__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'cargo help tauri permission commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__permission__add_commands] )) ||
_cargo__help__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri permission add commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__permission__ls_commands] )) ||
_cargo__help__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri permission ls commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__permission__new_commands] )) ||
_cargo__help__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri permission new commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__permission__rm_commands] )) ||
_cargo__help__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri permission rm commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__plugin_commands] )) ||
_cargo__help__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'cargo help tauri plugin commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__plugin__android_commands] )) ||
_cargo__help__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'cargo help tauri plugin android commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__plugin__android__init_commands] )) ||
_cargo__help__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri plugin android init commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__plugin__init_commands] )) ||
_cargo__help__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri plugin init commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__plugin__ios_commands] )) ||
_cargo__help__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'cargo help tauri plugin ios commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__plugin__ios__init_commands] )) ||
_cargo__help__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri plugin ios init commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__plugin__new_commands] )) ||
_cargo__help__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri plugin new commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__signer_commands] )) ||
_cargo__help__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'cargo help tauri signer commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__signer__generate_commands] )) ||
_cargo__help__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri signer generate commands' commands "$@"
}
(( $+functions[_cargo__help__tauri__signer__sign_commands] )) ||
_cargo__help__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'cargo help tauri signer sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri_commands] )) ||
_npm__run__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri commands' commands "$@"
}
(( $+functions[_npm__run__tauri__add_commands] )) ||
_npm__run__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android_commands] )) ||
_npm__run__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__android-studio-script_commands] )) ||
_npm__run__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__build_commands] )) ||
_npm__run__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__dev_commands] )) ||
_npm__run__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help_commands] )) ||
_npm__run__tauri__android__help_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri android help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__android-studio-script_commands] )) ||
_npm__run__tauri__android__help__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__build_commands] )) ||
_npm__run__tauri__android__help__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__dev_commands] )) ||
_npm__run__tauri__android__help__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__help_commands] )) ||
_npm__run__tauri__android__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__init_commands] )) ||
_npm__run__tauri__android__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__init_commands] )) ||
_npm__run__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__build_commands] )) ||
_npm__run__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__bundle_commands] )) ||
_npm__run__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri bundle commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability_commands] )) ||
_npm__run__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri capability commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help_commands] )) ||
_npm__run__tauri__capability__help_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri capability help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help__help_commands] )) ||
_npm__run__tauri__capability__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help__new_commands] )) ||
_npm__run__tauri__capability__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__new_commands] )) ||
_npm__run__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__completions_commands] )) ||
_npm__run__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri completions commands' commands "$@"
}
(( $+functions[_npm__run__tauri__dev_commands] )) ||
_npm__run__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help_commands] )) ||
_npm__run__tauri__help_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__add_commands] )) ||
_npm__run__tauri__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android_commands] )) ||
_npm__run__tauri__help__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'npm run tauri help android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__android-studio-script_commands] )) ||
_npm__run__tauri__help__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__build_commands] )) ||
_npm__run__tauri__help__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__dev_commands] )) ||
_npm__run__tauri__help__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__init_commands] )) ||
_npm__run__tauri__help__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__build_commands] )) ||
_npm__run__tauri__help__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__bundle_commands] )) ||
_npm__run__tauri__help__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help bundle commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__capability_commands] )) ||
_npm__run__tauri__help__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'npm run tauri help capability commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__capability__new_commands] )) ||
_npm__run__tauri__help__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help capability new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__completions_commands] )) ||
_npm__run__tauri__help__completions_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help completions commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__dev_commands] )) ||
_npm__run__tauri__help__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__help_commands] )) ||
_npm__run__tauri__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__icon_commands] )) ||
_npm__run__tauri__help__icon_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help icon commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__info_commands] )) ||
_npm__run__tauri__help__info_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help info commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__init_commands] )) ||
_npm__run__tauri__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__inspect_commands] )) ||
_npm__run__tauri__help__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'npm run tauri help inspect commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__inspect__wix-upgrade-code_commands] )) ||
_npm__run__tauri__help__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__migrate_commands] )) ||
_npm__run__tauri__help__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help migrate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission_commands] )) ||
_npm__run__tauri__help__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'npm run tauri help permission commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__add_commands] )) ||
_npm__run__tauri__help__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__ls_commands] )) ||
_npm__run__tauri__help__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__new_commands] )) ||
_npm__run__tauri__help__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__rm_commands] )) ||
_npm__run__tauri__help__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin_commands] )) ||
_npm__run__tauri__help__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__android_commands] )) ||
_npm__run__tauri__help__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__android__init_commands] )) ||
_npm__run__tauri__help__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__init_commands] )) ||
_npm__run__tauri__help__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__ios_commands] )) ||
_npm__run__tauri__help__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__ios__init_commands] )) ||
_npm__run__tauri__help__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__new_commands] )) ||
_npm__run__tauri__help__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer_commands] )) ||
_npm__run__tauri__help__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'npm run tauri help signer commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer__generate_commands] )) ||
_npm__run__tauri__help__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help signer generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer__sign_commands] )) ||
_npm__run__tauri__help__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help signer sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri__icon_commands] )) ||
_npm__run__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri icon commands' commands "$@"
}
(( $+functions[_npm__run__tauri__info_commands] )) ||
_npm__run__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri info commands' commands "$@"
}
(( $+functions[_npm__run__tauri__init_commands] )) ||
_npm__run__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect_commands] )) ||
_npm__run__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri inspect commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help_commands] )) ||
_npm__run__tauri__inspect__help_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri inspect help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help__help_commands] )) ||
_npm__run__tauri__inspect__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help__wix-upgrade-code_commands] )) ||
_npm__run__tauri__inspect__help__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect help wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__wix-upgrade-code_commands] )) ||
_npm__run__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__migrate_commands] )) ||
_npm__run__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri migrate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission_commands] )) ||
_npm__run__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri permission commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__add_commands] )) ||
_npm__run__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help_commands] )) ||
_npm__run__tauri__permission__help_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri permission help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__add_commands] )) ||
_npm__run__tauri__permission__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__help_commands] )) ||
_npm__run__tauri__permission__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__ls_commands] )) ||
_npm__run__tauri__permission__help__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__new_commands] )) ||
_npm__run__tauri__permission__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__rm_commands] )) ||
_npm__run__tauri__permission__help__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__ls_commands] )) ||
_npm__run__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__new_commands] )) ||
_npm__run__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__rm_commands] )) ||
_npm__run__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin_commands] )) ||
_npm__run__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android_commands] )) ||
_npm__run__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help_commands] )) ||
_npm__run__tauri__plugin__android__help_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin android help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help__help_commands] )) ||
_npm__run__tauri__plugin__android__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help__init_commands] )) ||
_npm__run__tauri__plugin__android__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__init_commands] )) ||
_npm__run__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help_commands] )) ||
_npm__run__tauri__plugin__help_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__android_commands] )) ||
_npm__run__tauri__plugin__help__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri plugin help android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__android__init_commands] )) ||
_npm__run__tauri__plugin__help__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__help_commands] )) ||
_npm__run__tauri__plugin__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__init_commands] )) ||
_npm__run__tauri__plugin__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__ios_commands] )) ||
_npm__run__tauri__plugin__help__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri plugin help ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__ios__init_commands] )) ||
_npm__run__tauri__plugin__help__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__new_commands] )) ||
_npm__run__tauri__plugin__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__init_commands] )) ||
_npm__run__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios_commands] )) ||
_npm__run__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help_commands] )) ||
_npm__run__tauri__plugin__ios__help_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin ios help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help__help_commands] )) ||
_npm__run__tauri__plugin__ios__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help__init_commands] )) ||
_npm__run__tauri__plugin__ios__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__init_commands] )) ||
_npm__run__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__new_commands] )) ||
_npm__run__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer_commands] )) ||
_npm__run__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri signer commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__generate_commands] )) ||
_npm__run__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help_commands] )) ||
_npm__run__tauri__signer__help_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri signer help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__generate_commands] )) ||
_npm__run__tauri__signer__help__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__help_commands] )) ||
_npm__run__tauri__signer__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__sign_commands] )) ||
_npm__run__tauri__signer__help__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__sign_commands] )) ||
_npm__run__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer sign commands' commands "$@"
}

if [ "$funcstack[1]" = "_cargo" ]; then
    _cargo "$@"
else
    compdef _cargo cargo
fi

#compdef pnpm

autoload -U is-at-least

_pnpm() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_pnpm_commands" \
"*::: :->pnpm" \
&& ret=0
    case $state in
    (pnpm)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:pnpm-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'-A+[Name of your Tauri application]:APP_NAME: ' \
'--app-name=[Name of your Tauri application]:APP_NAME: ' \
'-W+[Window title of your Tauri application]:WINDOW_TITLE: ' \
'--window-title=[Window title of your Tauri application]:WINDOW_TITLE: ' \
'-D+[Web assets location, relative to <project-dir>/src-tauri]:FRONTEND_DIST: ' \
'--frontend-dist=[Web assets location, relative to <project-dir>/src-tauri]:FRONTEND_DIST: ' \
'-P+[Url of your dev server]:DEV_URL: ' \
'--dev-url=[Url of your dev server]:DEV_URL: ' \
'--before-dev-command=[A shell command to run before \`tauri dev\` kicks in]:BEFORE_DEV_COMMAND: ' \
'--before-build-command=[A shell command to run before \`tauri build\` kicks in]:BEFORE_BUILD_COMMAND: ' \
'--ci[Skip prompting for values]' \
'-f[Force init to overwrite the src-tauri folder]' \
'--force[Force init to overwrite the src-tauri folder]' \
'-l[Enables logging]' \
'--log[Enables logging]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
'-r+[Binary to use to run the application]:RUNNER: ' \
'--runner=[Binary to use to run the application]:RUNNER: ' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--port=[Specify port for the built-in dev server for static files. Defaults to 1430]:PORT: ' \
'-e[Exit on panic]' \
'--exit-on-panic[Exit on panic]' \
'--release[Run the code in release mode]' \
'--no-dev-server-wait[Skip waiting for the frontend dev server to start before building the tauri application]' \
'--no-watch[Disable the file watcher]' \
'--no-dev-server[Disable the built-in dev server for static files]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'*::args -- Command line arguments passed to the runner. Use `--` to explicitly mark the start of the arguments. Arguments after a second `--` are passed to the application e.g. `tauri dev -- \[runnerArgs\] -- \[appArgs\]`:' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
'-r+[Binary to use to build the application, defaults to \`cargo\`]:RUNNER: ' \
'--runner=[Binary to use to build the application, defaults to \`cargo\`]:RUNNER: ' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'*-f+[Space or comma separated list of features to activate]' \
'*--features=[Space or comma separated list of features to activate]' \
'*-b+[Space or comma separated list of bundles to package]' \
'*--bundles=[Space or comma separated list of bundles to package]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--no-bundle[Skip the bundling step even if \`bundle > active\` is \`true\` in tauri config]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'*::args -- Command line arguments passed to the runner. Use `--` to explicitly mark the start of the arguments:' \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
'*-b+[Space or comma separated list of bundles to package]' \
'*--bundles=[Space or comma separated list of bundles to package]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'*-f+[Space or comma separated list of features, should be the same features passed to \`tauri build\` if any]' \
'*--features=[Space or comma separated list of features, should be the same features passed to \`tauri build\` if any]' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'--ci[Skip prompting for values]' \
'--skip-targets-install[Skips installing rust toolchains via rustup]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--host=[Use the public network address for the development server. If an actual address it provided, it is used instead of prompting to pick one]' \
'--port=[Specify port for the built-in dev server for static files. Defaults to 1430]:PORT: ' \
'-e[Exit on panic]' \
'--exit-on-panic[Exit on panic]' \
'--release[Run the code in release mode]' \
'--no-dev-server-wait[Skip waiting for the frontend dev server to start before building the tauri application]' \
'--no-watch[Disable the file watcher]' \
'-o[Open Android Studio instead of trying to run on a connected device]' \
'--open[Open Android Studio instead of trying to run on a connected device]' \
'--force-ip-prompt[Force prompting for an IP to use to connect to the dev server on mobile]' \
'--no-dev-server[Disable the built-in dev server for static files]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::device -- Runs on the given device name:' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
'*-t+[Which targets to build (all by default)]' \
'*--target=[Which targets to build (all by default)]' \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--split-per-abi[Whether to split the APKs and AABs per ABIs]' \
'--apk[Build APKs]' \
'--aab[Build AABs]' \
'-o[Open Android Studio]' \
'--open[Open Android Studio]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
'*-t+[Targets to build]' \
'*--target=[Targets to build]' \
'-r[Builds with the release flag]' \
'--release[Builds with the release flag]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__android__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-android-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
'--interactive[Interactive mode to apply automatic fixes]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'-t+[Git tag to use]:TAG: ' \
'--tag=[Git tag to use]:TAG: ' \
'-r+[Git rev to use]:REV: ' \
'--rev=[Git rev to use]:REV: ' \
'-b+[Git branch to use]:BRANCH: ' \
'--branch=[Git branch to use]:BRANCH: ' \
'--no-fmt[Don'\''t format code with rustfmt]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':plugin -- The plugin to add:' \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-a+[Author name]:AUTHOR: ' \
'--author=[Author name]:AUTHOR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--no-api[Initializes a Tauri plugin without the TypeScript API]' \
'--no-example[Initialize without an example project]' \
'--android[Whether to initialize an Android project for the plugin]' \
'--ios[Whether to initialize an iOS project for the plugin]' \
'--mobile[Whether to initialize Android and iOS projects for the plugin]' \
'--github-workflows[Generate github workflows]' \
'--tauri[Initializes a Tauri core plugin (internal usage)]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
':plugin_name -- Name of your Tauri plugin:' \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-a+[Author name]:AUTHOR: ' \
'--author=[Author name]:AUTHOR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--no-api[Initializes a Tauri plugin without the TypeScript API]' \
'--no-example[Initialize without an example project]' \
'--android[Whether to initialize an Android project for the plugin]' \
'--ios[Whether to initialize an iOS project for the plugin]' \
'--mobile[Whether to initialize Android and iOS projects for the plugin]' \
'--github-workflows[Generate github workflows]' \
'--tauri[Initializes a Tauri core plugin (internal usage)]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-o+[The output directory]:OUT_DIR: ' \
'--out-dir=[The output directory]:OUT_DIR: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. Must match the current plugin'\''s name. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__android__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-android-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-o+[The output directory]:OUT_DIR: ' \
'--out-dir=[The output directory]:OUT_DIR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. Must match the current plugin'\''s name. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__ios__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-ios-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
'-o+[Output directory. Default\: '\''icons'\'' directory next to the tauri.conf.json file]:OUTPUT:_files' \
'--output=[Output directory. Default\: '\''icons'\'' directory next to the tauri.conf.json file]:OUTPUT:_files' \
'*-p+[Custom PNG icon sizes to generate. When set, the default icons are not generated]:PNG: ' \
'*--png=[Custom PNG icon sizes to generate. When set, the default icons are not generated]:PNG: ' \
'--ios-color=[The background color of the iOS icon - string as defined in the W3C'\''s CSS Color Module Level 4 <https\://www.w3.org/TR/css-color-4/>]:IOS_COLOR: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::input -- Path to the source icon (squared PNG or SVG file with transparency):_files' \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
'(-f --private-key-path)-k+[Load the private key from a string]:PRIVATE_KEY: ' \
'(-f --private-key-path)--private-key=[Load the private key from a string]:PRIVATE_KEY: ' \
'(-k --private-key)-f+[Load the private key from a file]:PRIVATE_KEY_PATH:_files' \
'(-k --private-key)--private-key-path=[Load the private key from a file]:PRIVATE_KEY_PATH:_files' \
'-p+[Set private key password when signing]:PASSWORD: ' \
'--password=[Set private key password when signing]:PASSWORD: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':file -- Sign the specified file:_files' \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
'-p+[Set private key password when signing]:PASSWORD: ' \
'--password=[Set private key password when signing]:PASSWORD: ' \
'-w+[Write private key to a file]:WRITE_KEYS:_files' \
'--write-keys=[Write private key to a file]:WRITE_KEYS:_files' \
'-f[Overwrite private key even if it exists on the specified path]' \
'--force[Overwrite private key even if it exists on the specified path]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__signer__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-signer-help-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
'-s+[Shell to generate a completion script for.]:SHELL:(bash elvish fish powershell zsh)' \
'--shell=[Shell to generate a completion script for.]:SHELL:(bash elvish fish powershell zsh)' \
'-o+[Output file for the shell completions. By default the completions are printed to stdout]:OUTPUT:_files' \
'--output=[Output file for the shell completions. By default the completions are printed to stdout]:OUTPUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'--description=[Permission description]:DESCRIPTION: ' \
'*-a+[List of commands to allow]:ALLOW: ' \
'*--allow=[List of commands to allow]:ALLOW: ' \
'*-d+[List of commands to deny]:DENY: ' \
'*--deny=[List of commands to deny]:DENY: ' \
'--format=[Output file format]:FORMAT:(json toml)' \
'-o+[The output file]:OUT:_files' \
'--out=[The output file]:OUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::identifier -- Permission identifier:' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':identifier -- Permission to add:' \
'::capability -- Capability to add the permission to:' \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':identifier -- Permission to remove:' \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
'-f+[Permission identifier filter]:FILTER: ' \
'--filter=[Permission identifier filter]:FILTER: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin -- Name of the plugin to list permissions:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__permission__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-permission-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'--description=[Capability description]:DESCRIPTION: ' \
'*--windows=[Capability windows]:WINDOWS: ' \
'*--permission=[Capability permissions]:PERMISSION: ' \
'--format=[Output file format]:FORMAT:(json toml)' \
'-o+[The output file]:OUT:_files' \
'--out=[The output file]:OUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::identifier -- Capability identifier:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__capability__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-capability-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__inspect__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-inspect-help-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_pnpm__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:pnpm-help-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
":: :_pnpm__help__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:pnpm-help-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_pnpm__help__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:pnpm-help-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_pnpm__help__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:pnpm-help-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_pnpm__help__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:pnpm-help-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_pnpm__help__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:pnpm-help-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_pnpm__help__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:pnpm-help-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_pnpm__help__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:pnpm-help-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_pnpm__help__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:pnpm-help-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_pnpm__help__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:pnpm-help-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_pnpm_commands] )) ||
_pnpm_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'pnpm commands' commands "$@"
}
(( $+functions[_npm__run__tauri_commands] )) ||
_npm__run__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri commands' commands "$@"
}
(( $+functions[_npm__run__tauri__add_commands] )) ||
_npm__run__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android_commands] )) ||
_npm__run__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__android-studio-script_commands] )) ||
_npm__run__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__build_commands] )) ||
_npm__run__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__dev_commands] )) ||
_npm__run__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help_commands] )) ||
_npm__run__tauri__android__help_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri android help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__android-studio-script_commands] )) ||
_npm__run__tauri__android__help__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__build_commands] )) ||
_npm__run__tauri__android__help__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__dev_commands] )) ||
_npm__run__tauri__android__help__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__help_commands] )) ||
_npm__run__tauri__android__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__init_commands] )) ||
_npm__run__tauri__android__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__init_commands] )) ||
_npm__run__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__build_commands] )) ||
_npm__run__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__bundle_commands] )) ||
_npm__run__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri bundle commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability_commands] )) ||
_npm__run__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri capability commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help_commands] )) ||
_npm__run__tauri__capability__help_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri capability help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help__help_commands] )) ||
_npm__run__tauri__capability__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help__new_commands] )) ||
_npm__run__tauri__capability__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__new_commands] )) ||
_npm__run__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__completions_commands] )) ||
_npm__run__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri completions commands' commands "$@"
}
(( $+functions[_npm__run__tauri__dev_commands] )) ||
_npm__run__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help_commands] )) ||
_npm__run__tauri__help_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__add_commands] )) ||
_npm__run__tauri__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android_commands] )) ||
_npm__run__tauri__help__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'npm run tauri help android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__android-studio-script_commands] )) ||
_npm__run__tauri__help__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__build_commands] )) ||
_npm__run__tauri__help__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__dev_commands] )) ||
_npm__run__tauri__help__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__init_commands] )) ||
_npm__run__tauri__help__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__build_commands] )) ||
_npm__run__tauri__help__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__bundle_commands] )) ||
_npm__run__tauri__help__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help bundle commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__capability_commands] )) ||
_npm__run__tauri__help__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'npm run tauri help capability commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__capability__new_commands] )) ||
_npm__run__tauri__help__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help capability new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__completions_commands] )) ||
_npm__run__tauri__help__completions_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help completions commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__dev_commands] )) ||
_npm__run__tauri__help__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__help_commands] )) ||
_npm__run__tauri__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__icon_commands] )) ||
_npm__run__tauri__help__icon_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help icon commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__info_commands] )) ||
_npm__run__tauri__help__info_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help info commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__init_commands] )) ||
_npm__run__tauri__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__inspect_commands] )) ||
_npm__run__tauri__help__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'npm run tauri help inspect commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__inspect__wix-upgrade-code_commands] )) ||
_npm__run__tauri__help__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__migrate_commands] )) ||
_npm__run__tauri__help__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help migrate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission_commands] )) ||
_npm__run__tauri__help__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'npm run tauri help permission commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__add_commands] )) ||
_npm__run__tauri__help__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__ls_commands] )) ||
_npm__run__tauri__help__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__new_commands] )) ||
_npm__run__tauri__help__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__rm_commands] )) ||
_npm__run__tauri__help__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin_commands] )) ||
_npm__run__tauri__help__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__android_commands] )) ||
_npm__run__tauri__help__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__android__init_commands] )) ||
_npm__run__tauri__help__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__init_commands] )) ||
_npm__run__tauri__help__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__ios_commands] )) ||
_npm__run__tauri__help__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__ios__init_commands] )) ||
_npm__run__tauri__help__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__new_commands] )) ||
_npm__run__tauri__help__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer_commands] )) ||
_npm__run__tauri__help__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'npm run tauri help signer commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer__generate_commands] )) ||
_npm__run__tauri__help__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help signer generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer__sign_commands] )) ||
_npm__run__tauri__help__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help signer sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri__icon_commands] )) ||
_npm__run__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri icon commands' commands "$@"
}
(( $+functions[_npm__run__tauri__info_commands] )) ||
_npm__run__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri info commands' commands "$@"
}
(( $+functions[_npm__run__tauri__init_commands] )) ||
_npm__run__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect_commands] )) ||
_npm__run__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri inspect commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help_commands] )) ||
_npm__run__tauri__inspect__help_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri inspect help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help__help_commands] )) ||
_npm__run__tauri__inspect__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help__wix-upgrade-code_commands] )) ||
_npm__run__tauri__inspect__help__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect help wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__wix-upgrade-code_commands] )) ||
_npm__run__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__migrate_commands] )) ||
_npm__run__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri migrate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission_commands] )) ||
_npm__run__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri permission commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__add_commands] )) ||
_npm__run__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help_commands] )) ||
_npm__run__tauri__permission__help_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri permission help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__add_commands] )) ||
_npm__run__tauri__permission__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__help_commands] )) ||
_npm__run__tauri__permission__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__ls_commands] )) ||
_npm__run__tauri__permission__help__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__new_commands] )) ||
_npm__run__tauri__permission__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__rm_commands] )) ||
_npm__run__tauri__permission__help__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__ls_commands] )) ||
_npm__run__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__new_commands] )) ||
_npm__run__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__rm_commands] )) ||
_npm__run__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin_commands] )) ||
_npm__run__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android_commands] )) ||
_npm__run__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help_commands] )) ||
_npm__run__tauri__plugin__android__help_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin android help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help__help_commands] )) ||
_npm__run__tauri__plugin__android__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help__init_commands] )) ||
_npm__run__tauri__plugin__android__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__init_commands] )) ||
_npm__run__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help_commands] )) ||
_npm__run__tauri__plugin__help_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__android_commands] )) ||
_npm__run__tauri__plugin__help__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri plugin help android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__android__init_commands] )) ||
_npm__run__tauri__plugin__help__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__help_commands] )) ||
_npm__run__tauri__plugin__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__init_commands] )) ||
_npm__run__tauri__plugin__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__ios_commands] )) ||
_npm__run__tauri__plugin__help__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri plugin help ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__ios__init_commands] )) ||
_npm__run__tauri__plugin__help__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__new_commands] )) ||
_npm__run__tauri__plugin__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__init_commands] )) ||
_npm__run__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios_commands] )) ||
_npm__run__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help_commands] )) ||
_npm__run__tauri__plugin__ios__help_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin ios help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help__help_commands] )) ||
_npm__run__tauri__plugin__ios__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help__init_commands] )) ||
_npm__run__tauri__plugin__ios__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__init_commands] )) ||
_npm__run__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__new_commands] )) ||
_npm__run__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer_commands] )) ||
_npm__run__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri signer commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__generate_commands] )) ||
_npm__run__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help_commands] )) ||
_npm__run__tauri__signer__help_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri signer help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__generate_commands] )) ||
_npm__run__tauri__signer__help__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__help_commands] )) ||
_npm__run__tauri__signer__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__sign_commands] )) ||
_npm__run__tauri__signer__help__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__sign_commands] )) ||
_npm__run__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer sign commands' commands "$@"
}
(( $+functions[_pnpm__help_commands] )) ||
_pnpm__help_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'pnpm help commands' commands "$@"
}
(( $+functions[_pnpm__help__help_commands] )) ||
_pnpm__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help help commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri_commands] )) ||
_pnpm__help__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
    )
    _describe -t commands 'pnpm help tauri commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__add_commands] )) ||
_pnpm__help__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri add commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__android_commands] )) ||
_pnpm__help__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'pnpm help tauri android commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__android__android-studio-script_commands] )) ||
_pnpm__help__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__android__build_commands] )) ||
_pnpm__help__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri android build commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__android__dev_commands] )) ||
_pnpm__help__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri android dev commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__android__init_commands] )) ||
_pnpm__help__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri android init commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__build_commands] )) ||
_pnpm__help__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri build commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__bundle_commands] )) ||
_pnpm__help__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri bundle commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__capability_commands] )) ||
_pnpm__help__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'pnpm help tauri capability commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__capability__new_commands] )) ||
_pnpm__help__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri capability new commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__completions_commands] )) ||
_pnpm__help__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri completions commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__dev_commands] )) ||
_pnpm__help__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri dev commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__icon_commands] )) ||
_pnpm__help__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri icon commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__info_commands] )) ||
_pnpm__help__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri info commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__init_commands] )) ||
_pnpm__help__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri init commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__inspect_commands] )) ||
_pnpm__help__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'pnpm help tauri inspect commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__inspect__wix-upgrade-code_commands] )) ||
_pnpm__help__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__migrate_commands] )) ||
_pnpm__help__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri migrate commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__permission_commands] )) ||
_pnpm__help__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'pnpm help tauri permission commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__permission__add_commands] )) ||
_pnpm__help__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri permission add commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__permission__ls_commands] )) ||
_pnpm__help__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri permission ls commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__permission__new_commands] )) ||
_pnpm__help__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri permission new commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__permission__rm_commands] )) ||
_pnpm__help__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri permission rm commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__plugin_commands] )) ||
_pnpm__help__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'pnpm help tauri plugin commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__plugin__android_commands] )) ||
_pnpm__help__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'pnpm help tauri plugin android commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__plugin__android__init_commands] )) ||
_pnpm__help__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri plugin android init commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__plugin__init_commands] )) ||
_pnpm__help__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri plugin init commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__plugin__ios_commands] )) ||
_pnpm__help__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'pnpm help tauri plugin ios commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__plugin__ios__init_commands] )) ||
_pnpm__help__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri plugin ios init commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__plugin__new_commands] )) ||
_pnpm__help__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri plugin new commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__signer_commands] )) ||
_pnpm__help__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'pnpm help tauri signer commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__signer__generate_commands] )) ||
_pnpm__help__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri signer generate commands' commands "$@"
}
(( $+functions[_pnpm__help__tauri__signer__sign_commands] )) ||
_pnpm__help__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'pnpm help tauri signer sign commands' commands "$@"
}

if [ "$funcstack[1]" = "_pnpm" ]; then
    _pnpm "$@"
else
    compdef _pnpm pnpm
fi

#compdef npm

autoload -U is-at-least

_npm() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_npm_commands" \
"*::: :->npm" \
&& ret=0
    case $state in
    (npm)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-command-$line[1]:"
        case $line[1] in
            (run)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_npm__run_commands" \
"*::: :->run" \
&& ret=0

    case $state in
    (run)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'-A+[Name of your Tauri application]:APP_NAME: ' \
'--app-name=[Name of your Tauri application]:APP_NAME: ' \
'-W+[Window title of your Tauri application]:WINDOW_TITLE: ' \
'--window-title=[Window title of your Tauri application]:WINDOW_TITLE: ' \
'-D+[Web assets location, relative to <project-dir>/src-tauri]:FRONTEND_DIST: ' \
'--frontend-dist=[Web assets location, relative to <project-dir>/src-tauri]:FRONTEND_DIST: ' \
'-P+[Url of your dev server]:DEV_URL: ' \
'--dev-url=[Url of your dev server]:DEV_URL: ' \
'--before-dev-command=[A shell command to run before \`tauri dev\` kicks in]:BEFORE_DEV_COMMAND: ' \
'--before-build-command=[A shell command to run before \`tauri build\` kicks in]:BEFORE_BUILD_COMMAND: ' \
'--ci[Skip prompting for values]' \
'-f[Force init to overwrite the src-tauri folder]' \
'--force[Force init to overwrite the src-tauri folder]' \
'-l[Enables logging]' \
'--log[Enables logging]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
'-r+[Binary to use to run the application]:RUNNER: ' \
'--runner=[Binary to use to run the application]:RUNNER: ' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--port=[Specify port for the built-in dev server for static files. Defaults to 1430]:PORT: ' \
'-e[Exit on panic]' \
'--exit-on-panic[Exit on panic]' \
'--release[Run the code in release mode]' \
'--no-dev-server-wait[Skip waiting for the frontend dev server to start before building the tauri application]' \
'--no-watch[Disable the file watcher]' \
'--no-dev-server[Disable the built-in dev server for static files]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'*::args -- Command line arguments passed to the runner. Use `--` to explicitly mark the start of the arguments. Arguments after a second `--` are passed to the application e.g. `tauri dev -- \[runnerArgs\] -- \[appArgs\]`:' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
'-r+[Binary to use to build the application, defaults to \`cargo\`]:RUNNER: ' \
'--runner=[Binary to use to build the application, defaults to \`cargo\`]:RUNNER: ' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'*-f+[Space or comma separated list of features to activate]' \
'*--features=[Space or comma separated list of features to activate]' \
'*-b+[Space or comma separated list of bundles to package]' \
'*--bundles=[Space or comma separated list of bundles to package]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--no-bundle[Skip the bundling step even if \`bundle > active\` is \`true\` in tauri config]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'*::args -- Command line arguments passed to the runner. Use `--` to explicitly mark the start of the arguments:' \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
'*-b+[Space or comma separated list of bundles to package]' \
'*--bundles=[Space or comma separated list of bundles to package]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'*-f+[Space or comma separated list of features, should be the same features passed to \`tauri build\` if any]' \
'*--features=[Space or comma separated list of features, should be the same features passed to \`tauri build\` if any]' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'--ci[Skip prompting for values]' \
'--skip-targets-install[Skips installing rust toolchains via rustup]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--host=[Use the public network address for the development server. If an actual address it provided, it is used instead of prompting to pick one]' \
'--port=[Specify port for the built-in dev server for static files. Defaults to 1430]:PORT: ' \
'-e[Exit on panic]' \
'--exit-on-panic[Exit on panic]' \
'--release[Run the code in release mode]' \
'--no-dev-server-wait[Skip waiting for the frontend dev server to start before building the tauri application]' \
'--no-watch[Disable the file watcher]' \
'-o[Open Android Studio instead of trying to run on a connected device]' \
'--open[Open Android Studio instead of trying to run on a connected device]' \
'--force-ip-prompt[Force prompting for an IP to use to connect to the dev server on mobile]' \
'--no-dev-server[Disable the built-in dev server for static files]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::device -- Runs on the given device name:' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
'*-t+[Which targets to build (all by default)]' \
'*--target=[Which targets to build (all by default)]' \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--split-per-abi[Whether to split the APKs and AABs per ABIs]' \
'--apk[Build APKs]' \
'--aab[Build AABs]' \
'-o[Open Android Studio]' \
'--open[Open Android Studio]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
'*-t+[Targets to build]' \
'*--target=[Targets to build]' \
'-r[Builds with the release flag]' \
'--release[Builds with the release flag]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__android__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-android-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
'--interactive[Interactive mode to apply automatic fixes]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'-t+[Git tag to use]:TAG: ' \
'--tag=[Git tag to use]:TAG: ' \
'-r+[Git rev to use]:REV: ' \
'--rev=[Git rev to use]:REV: ' \
'-b+[Git branch to use]:BRANCH: ' \
'--branch=[Git branch to use]:BRANCH: ' \
'--no-fmt[Don'\''t format code with rustfmt]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':plugin -- The plugin to add:' \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-a+[Author name]:AUTHOR: ' \
'--author=[Author name]:AUTHOR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--no-api[Initializes a Tauri plugin without the TypeScript API]' \
'--no-example[Initialize without an example project]' \
'--android[Whether to initialize an Android project for the plugin]' \
'--ios[Whether to initialize an iOS project for the plugin]' \
'--mobile[Whether to initialize Android and iOS projects for the plugin]' \
'--github-workflows[Generate github workflows]' \
'--tauri[Initializes a Tauri core plugin (internal usage)]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
':plugin_name -- Name of your Tauri plugin:' \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-a+[Author name]:AUTHOR: ' \
'--author=[Author name]:AUTHOR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--no-api[Initializes a Tauri plugin without the TypeScript API]' \
'--no-example[Initialize without an example project]' \
'--android[Whether to initialize an Android project for the plugin]' \
'--ios[Whether to initialize an iOS project for the plugin]' \
'--mobile[Whether to initialize Android and iOS projects for the plugin]' \
'--github-workflows[Generate github workflows]' \
'--tauri[Initializes a Tauri core plugin (internal usage)]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-o+[The output directory]:OUT_DIR: ' \
'--out-dir=[The output directory]:OUT_DIR: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. Must match the current plugin'\''s name. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__android__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-android-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-o+[The output directory]:OUT_DIR: ' \
'--out-dir=[The output directory]:OUT_DIR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. Must match the current plugin'\''s name. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__ios__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-ios-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
'-o+[Output directory. Default\: '\''icons'\'' directory next to the tauri.conf.json file]:OUTPUT:_files' \
'--output=[Output directory. Default\: '\''icons'\'' directory next to the tauri.conf.json file]:OUTPUT:_files' \
'*-p+[Custom PNG icon sizes to generate. When set, the default icons are not generated]:PNG: ' \
'*--png=[Custom PNG icon sizes to generate. When set, the default icons are not generated]:PNG: ' \
'--ios-color=[The background color of the iOS icon - string as defined in the W3C'\''s CSS Color Module Level 4 <https\://www.w3.org/TR/css-color-4/>]:IOS_COLOR: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::input -- Path to the source icon (squared PNG or SVG file with transparency):_files' \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
'(-f --private-key-path)-k+[Load the private key from a string]:PRIVATE_KEY: ' \
'(-f --private-key-path)--private-key=[Load the private key from a string]:PRIVATE_KEY: ' \
'(-k --private-key)-f+[Load the private key from a file]:PRIVATE_KEY_PATH:_files' \
'(-k --private-key)--private-key-path=[Load the private key from a file]:PRIVATE_KEY_PATH:_files' \
'-p+[Set private key password when signing]:PASSWORD: ' \
'--password=[Set private key password when signing]:PASSWORD: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':file -- Sign the specified file:_files' \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
'-p+[Set private key password when signing]:PASSWORD: ' \
'--password=[Set private key password when signing]:PASSWORD: ' \
'-w+[Write private key to a file]:WRITE_KEYS:_files' \
'--write-keys=[Write private key to a file]:WRITE_KEYS:_files' \
'-f[Overwrite private key even if it exists on the specified path]' \
'--force[Overwrite private key even if it exists on the specified path]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__signer__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-signer-help-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
'-s+[Shell to generate a completion script for.]:SHELL:(bash elvish fish powershell zsh)' \
'--shell=[Shell to generate a completion script for.]:SHELL:(bash elvish fish powershell zsh)' \
'-o+[Output file for the shell completions. By default the completions are printed to stdout]:OUTPUT:_files' \
'--output=[Output file for the shell completions. By default the completions are printed to stdout]:OUTPUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'--description=[Permission description]:DESCRIPTION: ' \
'*-a+[List of commands to allow]:ALLOW: ' \
'*--allow=[List of commands to allow]:ALLOW: ' \
'*-d+[List of commands to deny]:DENY: ' \
'*--deny=[List of commands to deny]:DENY: ' \
'--format=[Output file format]:FORMAT:(json toml)' \
'-o+[The output file]:OUT:_files' \
'--out=[The output file]:OUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::identifier -- Permission identifier:' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':identifier -- Permission to add:' \
'::capability -- Capability to add the permission to:' \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':identifier -- Permission to remove:' \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
'-f+[Permission identifier filter]:FILTER: ' \
'--filter=[Permission identifier filter]:FILTER: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin -- Name of the plugin to list permissions:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__permission__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-permission-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'--description=[Capability description]:DESCRIPTION: ' \
'*--windows=[Capability windows]:WINDOWS: ' \
'*--permission=[Capability permissions]:PERMISSION: ' \
'--format=[Output file format]:FORMAT:(json toml)' \
'-o+[The output file]:OUT:_files' \
'--out=[The output file]:OUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::identifier -- Capability identifier:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__capability__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-capability-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__inspect__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-inspect-help-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-help-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__help__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-help-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__help__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-help-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__help__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-help-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__help__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-help-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__help__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-help-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__help__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-help-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__help__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-help-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__help__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-help-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__help__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-help-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-help-command-$line[1]:"
        case $line[1] in
            (run)
_arguments "${_arguments_options[@]}" : \
":: :_npm__help__run_commands" \
"*::: :->run" \
&& ret=0

    case $state in
    (run)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-help-run-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
":: :_npm__help__run__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-help-run-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__help__run__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-help-run-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_npm__help__run__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-help-run-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__help__run__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-help-run-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_npm__help__run__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-help-run-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_npm__help__run__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-help-run-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_npm__help__run__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-help-run-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_npm__help__run__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-help-run-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_npm__help__run__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-help-run-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_npm_commands] )) ||
_npm_commands() {
    local commands; commands=(
'run:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm commands' commands "$@"
}
(( $+functions[_npm__help_commands] )) ||
_npm__help_commands() {
    local commands; commands=(
'run:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm help commands' commands "$@"
}
(( $+functions[_npm__help__help_commands] )) ||
_npm__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm help help commands' commands "$@"
}
(( $+functions[_npm__help__run_commands] )) ||
_npm__help__run_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
    )
    _describe -t commands 'npm help run commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri_commands] )) ||
_npm__help__run__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
    )
    _describe -t commands 'npm help run tauri commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__add_commands] )) ||
_npm__help__run__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri add commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__android_commands] )) ||
_npm__help__run__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'npm help run tauri android commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__android__android-studio-script_commands] )) ||
_npm__help__run__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__android__build_commands] )) ||
_npm__help__run__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri android build commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__android__dev_commands] )) ||
_npm__help__run__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri android dev commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__android__init_commands] )) ||
_npm__help__run__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri android init commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__build_commands] )) ||
_npm__help__run__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri build commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__bundle_commands] )) ||
_npm__help__run__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri bundle commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__capability_commands] )) ||
_npm__help__run__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'npm help run tauri capability commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__capability__new_commands] )) ||
_npm__help__run__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri capability new commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__completions_commands] )) ||
_npm__help__run__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri completions commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__dev_commands] )) ||
_npm__help__run__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri dev commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__icon_commands] )) ||
_npm__help__run__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri icon commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__info_commands] )) ||
_npm__help__run__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri info commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__init_commands] )) ||
_npm__help__run__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri init commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__inspect_commands] )) ||
_npm__help__run__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'npm help run tauri inspect commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__inspect__wix-upgrade-code_commands] )) ||
_npm__help__run__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__migrate_commands] )) ||
_npm__help__run__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri migrate commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__permission_commands] )) ||
_npm__help__run__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'npm help run tauri permission commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__permission__add_commands] )) ||
_npm__help__run__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri permission add commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__permission__ls_commands] )) ||
_npm__help__run__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri permission ls commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__permission__new_commands] )) ||
_npm__help__run__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri permission new commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__permission__rm_commands] )) ||
_npm__help__run__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri permission rm commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__plugin_commands] )) ||
_npm__help__run__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'npm help run tauri plugin commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__plugin__android_commands] )) ||
_npm__help__run__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm help run tauri plugin android commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__plugin__android__init_commands] )) ||
_npm__help__run__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri plugin android init commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__plugin__init_commands] )) ||
_npm__help__run__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri plugin init commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__plugin__ios_commands] )) ||
_npm__help__run__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm help run tauri plugin ios commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__plugin__ios__init_commands] )) ||
_npm__help__run__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri plugin ios init commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__plugin__new_commands] )) ||
_npm__help__run__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri plugin new commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__signer_commands] )) ||
_npm__help__run__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'npm help run tauri signer commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__signer__generate_commands] )) ||
_npm__help__run__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri signer generate commands' commands "$@"
}
(( $+functions[_npm__help__run__tauri__signer__sign_commands] )) ||
_npm__help__run__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm help run tauri signer sign commands' commands "$@"
}
(( $+functions[_npm__run_commands] )) ||
_npm__run_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run commands' commands "$@"
}
(( $+functions[_npm__run__help_commands] )) ||
_npm__run__help_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run help commands' commands "$@"
}
(( $+functions[_npm__run__help__help_commands] )) ||
_npm__run__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help help commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri_commands] )) ||
_npm__run__help__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
    )
    _describe -t commands 'npm run help tauri commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__add_commands] )) ||
_npm__run__help__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri add commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__android_commands] )) ||
_npm__run__help__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'npm run help tauri android commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__android__android-studio-script_commands] )) ||
_npm__run__help__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__android__build_commands] )) ||
_npm__run__help__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri android build commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__android__dev_commands] )) ||
_npm__run__help__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri android dev commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__android__init_commands] )) ||
_npm__run__help__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri android init commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__build_commands] )) ||
_npm__run__help__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri build commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__bundle_commands] )) ||
_npm__run__help__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri bundle commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__capability_commands] )) ||
_npm__run__help__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'npm run help tauri capability commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__capability__new_commands] )) ||
_npm__run__help__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri capability new commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__completions_commands] )) ||
_npm__run__help__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri completions commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__dev_commands] )) ||
_npm__run__help__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri dev commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__icon_commands] )) ||
_npm__run__help__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri icon commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__info_commands] )) ||
_npm__run__help__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri info commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__init_commands] )) ||
_npm__run__help__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri init commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__inspect_commands] )) ||
_npm__run__help__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'npm run help tauri inspect commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__inspect__wix-upgrade-code_commands] )) ||
_npm__run__help__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__migrate_commands] )) ||
_npm__run__help__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri migrate commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__permission_commands] )) ||
_npm__run__help__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'npm run help tauri permission commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__permission__add_commands] )) ||
_npm__run__help__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri permission add commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__permission__ls_commands] )) ||
_npm__run__help__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri permission ls commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__permission__new_commands] )) ||
_npm__run__help__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri permission new commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__permission__rm_commands] )) ||
_npm__run__help__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri permission rm commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__plugin_commands] )) ||
_npm__run__help__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'npm run help tauri plugin commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__plugin__android_commands] )) ||
_npm__run__help__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run help tauri plugin android commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__plugin__android__init_commands] )) ||
_npm__run__help__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri plugin android init commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__plugin__init_commands] )) ||
_npm__run__help__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri plugin init commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__plugin__ios_commands] )) ||
_npm__run__help__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run help tauri plugin ios commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__plugin__ios__init_commands] )) ||
_npm__run__help__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri plugin ios init commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__plugin__new_commands] )) ||
_npm__run__help__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri plugin new commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__signer_commands] )) ||
_npm__run__help__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'npm run help tauri signer commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__signer__generate_commands] )) ||
_npm__run__help__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri signer generate commands' commands "$@"
}
(( $+functions[_npm__run__help__tauri__signer__sign_commands] )) ||
_npm__run__help__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run help tauri signer sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri_commands] )) ||
_npm__run__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri commands' commands "$@"
}
(( $+functions[_npm__run__tauri__add_commands] )) ||
_npm__run__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android_commands] )) ||
_npm__run__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__android-studio-script_commands] )) ||
_npm__run__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__build_commands] )) ||
_npm__run__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__dev_commands] )) ||
_npm__run__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help_commands] )) ||
_npm__run__tauri__android__help_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri android help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__android-studio-script_commands] )) ||
_npm__run__tauri__android__help__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__build_commands] )) ||
_npm__run__tauri__android__help__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__dev_commands] )) ||
_npm__run__tauri__android__help__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__help_commands] )) ||
_npm__run__tauri__android__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__init_commands] )) ||
_npm__run__tauri__android__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__init_commands] )) ||
_npm__run__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__build_commands] )) ||
_npm__run__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__bundle_commands] )) ||
_npm__run__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri bundle commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability_commands] )) ||
_npm__run__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri capability commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help_commands] )) ||
_npm__run__tauri__capability__help_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri capability help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help__help_commands] )) ||
_npm__run__tauri__capability__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help__new_commands] )) ||
_npm__run__tauri__capability__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__new_commands] )) ||
_npm__run__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__completions_commands] )) ||
_npm__run__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri completions commands' commands "$@"
}
(( $+functions[_npm__run__tauri__dev_commands] )) ||
_npm__run__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help_commands] )) ||
_npm__run__tauri__help_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__add_commands] )) ||
_npm__run__tauri__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android_commands] )) ||
_npm__run__tauri__help__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'npm run tauri help android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__android-studio-script_commands] )) ||
_npm__run__tauri__help__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__build_commands] )) ||
_npm__run__tauri__help__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__dev_commands] )) ||
_npm__run__tauri__help__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__init_commands] )) ||
_npm__run__tauri__help__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__build_commands] )) ||
_npm__run__tauri__help__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__bundle_commands] )) ||
_npm__run__tauri__help__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help bundle commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__capability_commands] )) ||
_npm__run__tauri__help__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'npm run tauri help capability commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__capability__new_commands] )) ||
_npm__run__tauri__help__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help capability new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__completions_commands] )) ||
_npm__run__tauri__help__completions_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help completions commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__dev_commands] )) ||
_npm__run__tauri__help__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__help_commands] )) ||
_npm__run__tauri__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__icon_commands] )) ||
_npm__run__tauri__help__icon_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help icon commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__info_commands] )) ||
_npm__run__tauri__help__info_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help info commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__init_commands] )) ||
_npm__run__tauri__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__inspect_commands] )) ||
_npm__run__tauri__help__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'npm run tauri help inspect commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__inspect__wix-upgrade-code_commands] )) ||
_npm__run__tauri__help__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__migrate_commands] )) ||
_npm__run__tauri__help__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help migrate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission_commands] )) ||
_npm__run__tauri__help__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'npm run tauri help permission commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__add_commands] )) ||
_npm__run__tauri__help__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__ls_commands] )) ||
_npm__run__tauri__help__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__new_commands] )) ||
_npm__run__tauri__help__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__rm_commands] )) ||
_npm__run__tauri__help__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin_commands] )) ||
_npm__run__tauri__help__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__android_commands] )) ||
_npm__run__tauri__help__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__android__init_commands] )) ||
_npm__run__tauri__help__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__init_commands] )) ||
_npm__run__tauri__help__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__ios_commands] )) ||
_npm__run__tauri__help__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__ios__init_commands] )) ||
_npm__run__tauri__help__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__new_commands] )) ||
_npm__run__tauri__help__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer_commands] )) ||
_npm__run__tauri__help__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'npm run tauri help signer commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer__generate_commands] )) ||
_npm__run__tauri__help__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help signer generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer__sign_commands] )) ||
_npm__run__tauri__help__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help signer sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri__icon_commands] )) ||
_npm__run__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri icon commands' commands "$@"
}
(( $+functions[_npm__run__tauri__info_commands] )) ||
_npm__run__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri info commands' commands "$@"
}
(( $+functions[_npm__run__tauri__init_commands] )) ||
_npm__run__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect_commands] )) ||
_npm__run__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri inspect commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help_commands] )) ||
_npm__run__tauri__inspect__help_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri inspect help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help__help_commands] )) ||
_npm__run__tauri__inspect__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help__wix-upgrade-code_commands] )) ||
_npm__run__tauri__inspect__help__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect help wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__wix-upgrade-code_commands] )) ||
_npm__run__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__migrate_commands] )) ||
_npm__run__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri migrate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission_commands] )) ||
_npm__run__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri permission commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__add_commands] )) ||
_npm__run__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help_commands] )) ||
_npm__run__tauri__permission__help_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri permission help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__add_commands] )) ||
_npm__run__tauri__permission__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__help_commands] )) ||
_npm__run__tauri__permission__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__ls_commands] )) ||
_npm__run__tauri__permission__help__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__new_commands] )) ||
_npm__run__tauri__permission__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__rm_commands] )) ||
_npm__run__tauri__permission__help__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__ls_commands] )) ||
_npm__run__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__new_commands] )) ||
_npm__run__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__rm_commands] )) ||
_npm__run__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin_commands] )) ||
_npm__run__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android_commands] )) ||
_npm__run__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help_commands] )) ||
_npm__run__tauri__plugin__android__help_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin android help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help__help_commands] )) ||
_npm__run__tauri__plugin__android__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help__init_commands] )) ||
_npm__run__tauri__plugin__android__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__init_commands] )) ||
_npm__run__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help_commands] )) ||
_npm__run__tauri__plugin__help_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__android_commands] )) ||
_npm__run__tauri__plugin__help__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri plugin help android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__android__init_commands] )) ||
_npm__run__tauri__plugin__help__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__help_commands] )) ||
_npm__run__tauri__plugin__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__init_commands] )) ||
_npm__run__tauri__plugin__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__ios_commands] )) ||
_npm__run__tauri__plugin__help__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri plugin help ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__ios__init_commands] )) ||
_npm__run__tauri__plugin__help__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__new_commands] )) ||
_npm__run__tauri__plugin__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__init_commands] )) ||
_npm__run__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios_commands] )) ||
_npm__run__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help_commands] )) ||
_npm__run__tauri__plugin__ios__help_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin ios help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help__help_commands] )) ||
_npm__run__tauri__plugin__ios__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help__init_commands] )) ||
_npm__run__tauri__plugin__ios__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__init_commands] )) ||
_npm__run__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__new_commands] )) ||
_npm__run__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer_commands] )) ||
_npm__run__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri signer commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__generate_commands] )) ||
_npm__run__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help_commands] )) ||
_npm__run__tauri__signer__help_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri signer help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__generate_commands] )) ||
_npm__run__tauri__signer__help__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__help_commands] )) ||
_npm__run__tauri__signer__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__sign_commands] )) ||
_npm__run__tauri__signer__help__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__sign_commands] )) ||
_npm__run__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer sign commands' commands "$@"
}

if [ "$funcstack[1]" = "_npm" ]; then
    _npm "$@"
else
    compdef _npm npm
fi

#compdef yarn

autoload -U is-at-least

_yarn() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_yarn_commands" \
"*::: :->yarn" \
&& ret=0
    case $state in
    (yarn)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:yarn-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'-A+[Name of your Tauri application]:APP_NAME: ' \
'--app-name=[Name of your Tauri application]:APP_NAME: ' \
'-W+[Window title of your Tauri application]:WINDOW_TITLE: ' \
'--window-title=[Window title of your Tauri application]:WINDOW_TITLE: ' \
'-D+[Web assets location, relative to <project-dir>/src-tauri]:FRONTEND_DIST: ' \
'--frontend-dist=[Web assets location, relative to <project-dir>/src-tauri]:FRONTEND_DIST: ' \
'-P+[Url of your dev server]:DEV_URL: ' \
'--dev-url=[Url of your dev server]:DEV_URL: ' \
'--before-dev-command=[A shell command to run before \`tauri dev\` kicks in]:BEFORE_DEV_COMMAND: ' \
'--before-build-command=[A shell command to run before \`tauri build\` kicks in]:BEFORE_BUILD_COMMAND: ' \
'--ci[Skip prompting for values]' \
'-f[Force init to overwrite the src-tauri folder]' \
'--force[Force init to overwrite the src-tauri folder]' \
'-l[Enables logging]' \
'--log[Enables logging]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
'-r+[Binary to use to run the application]:RUNNER: ' \
'--runner=[Binary to use to run the application]:RUNNER: ' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--port=[Specify port for the built-in dev server for static files. Defaults to 1430]:PORT: ' \
'-e[Exit on panic]' \
'--exit-on-panic[Exit on panic]' \
'--release[Run the code in release mode]' \
'--no-dev-server-wait[Skip waiting for the frontend dev server to start before building the tauri application]' \
'--no-watch[Disable the file watcher]' \
'--no-dev-server[Disable the built-in dev server for static files]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'*::args -- Command line arguments passed to the runner. Use `--` to explicitly mark the start of the arguments. Arguments after a second `--` are passed to the application e.g. `tauri dev -- \[runnerArgs\] -- \[appArgs\]`:' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
'-r+[Binary to use to build the application, defaults to \`cargo\`]:RUNNER: ' \
'--runner=[Binary to use to build the application, defaults to \`cargo\`]:RUNNER: ' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'*-f+[Space or comma separated list of features to activate]' \
'*--features=[Space or comma separated list of features to activate]' \
'*-b+[Space or comma separated list of bundles to package]' \
'*--bundles=[Space or comma separated list of bundles to package]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--no-bundle[Skip the bundling step even if \`bundle > active\` is \`true\` in tauri config]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'*::args -- Command line arguments passed to the runner. Use `--` to explicitly mark the start of the arguments:' \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
'*-b+[Space or comma separated list of bundles to package]' \
'*--bundles=[Space or comma separated list of bundles to package]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'*-f+[Space or comma separated list of features, should be the same features passed to \`tauri build\` if any]' \
'*--features=[Space or comma separated list of features, should be the same features passed to \`tauri build\` if any]' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'--ci[Skip prompting for values]' \
'--skip-targets-install[Skips installing rust toolchains via rustup]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--host=[Use the public network address for the development server. If an actual address it provided, it is used instead of prompting to pick one]' \
'--port=[Specify port for the built-in dev server for static files. Defaults to 1430]:PORT: ' \
'-e[Exit on panic]' \
'--exit-on-panic[Exit on panic]' \
'--release[Run the code in release mode]' \
'--no-dev-server-wait[Skip waiting for the frontend dev server to start before building the tauri application]' \
'--no-watch[Disable the file watcher]' \
'-o[Open Android Studio instead of trying to run on a connected device]' \
'--open[Open Android Studio instead of trying to run on a connected device]' \
'--force-ip-prompt[Force prompting for an IP to use to connect to the dev server on mobile]' \
'--no-dev-server[Disable the built-in dev server for static files]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::device -- Runs on the given device name:' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
'*-t+[Which targets to build (all by default)]' \
'*--target=[Which targets to build (all by default)]' \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--split-per-abi[Whether to split the APKs and AABs per ABIs]' \
'--apk[Build APKs]' \
'--aab[Build AABs]' \
'-o[Open Android Studio]' \
'--open[Open Android Studio]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
'*-t+[Targets to build]' \
'*--target=[Targets to build]' \
'-r[Builds with the release flag]' \
'--release[Builds with the release flag]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__android__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-android-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
'--interactive[Interactive mode to apply automatic fixes]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'-t+[Git tag to use]:TAG: ' \
'--tag=[Git tag to use]:TAG: ' \
'-r+[Git rev to use]:REV: ' \
'--rev=[Git rev to use]:REV: ' \
'-b+[Git branch to use]:BRANCH: ' \
'--branch=[Git branch to use]:BRANCH: ' \
'--no-fmt[Don'\''t format code with rustfmt]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':plugin -- The plugin to add:' \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-a+[Author name]:AUTHOR: ' \
'--author=[Author name]:AUTHOR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--no-api[Initializes a Tauri plugin without the TypeScript API]' \
'--no-example[Initialize without an example project]' \
'--android[Whether to initialize an Android project for the plugin]' \
'--ios[Whether to initialize an iOS project for the plugin]' \
'--mobile[Whether to initialize Android and iOS projects for the plugin]' \
'--github-workflows[Generate github workflows]' \
'--tauri[Initializes a Tauri core plugin (internal usage)]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
':plugin_name -- Name of your Tauri plugin:' \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-a+[Author name]:AUTHOR: ' \
'--author=[Author name]:AUTHOR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--no-api[Initializes a Tauri plugin without the TypeScript API]' \
'--no-example[Initialize without an example project]' \
'--android[Whether to initialize an Android project for the plugin]' \
'--ios[Whether to initialize an iOS project for the plugin]' \
'--mobile[Whether to initialize Android and iOS projects for the plugin]' \
'--github-workflows[Generate github workflows]' \
'--tauri[Initializes a Tauri core plugin (internal usage)]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-o+[The output directory]:OUT_DIR: ' \
'--out-dir=[The output directory]:OUT_DIR: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. Must match the current plugin'\''s name. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__android__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-android-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-o+[The output directory]:OUT_DIR: ' \
'--out-dir=[The output directory]:OUT_DIR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. Must match the current plugin'\''s name. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__ios__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-ios-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
'-o+[Output directory. Default\: '\''icons'\'' directory next to the tauri.conf.json file]:OUTPUT:_files' \
'--output=[Output directory. Default\: '\''icons'\'' directory next to the tauri.conf.json file]:OUTPUT:_files' \
'*-p+[Custom PNG icon sizes to generate. When set, the default icons are not generated]:PNG: ' \
'*--png=[Custom PNG icon sizes to generate. When set, the default icons are not generated]:PNG: ' \
'--ios-color=[The background color of the iOS icon - string as defined in the W3C'\''s CSS Color Module Level 4 <https\://www.w3.org/TR/css-color-4/>]:IOS_COLOR: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::input -- Path to the source icon (squared PNG or SVG file with transparency):_files' \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
'(-f --private-key-path)-k+[Load the private key from a string]:PRIVATE_KEY: ' \
'(-f --private-key-path)--private-key=[Load the private key from a string]:PRIVATE_KEY: ' \
'(-k --private-key)-f+[Load the private key from a file]:PRIVATE_KEY_PATH:_files' \
'(-k --private-key)--private-key-path=[Load the private key from a file]:PRIVATE_KEY_PATH:_files' \
'-p+[Set private key password when signing]:PASSWORD: ' \
'--password=[Set private key password when signing]:PASSWORD: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':file -- Sign the specified file:_files' \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
'-p+[Set private key password when signing]:PASSWORD: ' \
'--password=[Set private key password when signing]:PASSWORD: ' \
'-w+[Write private key to a file]:WRITE_KEYS:_files' \
'--write-keys=[Write private key to a file]:WRITE_KEYS:_files' \
'-f[Overwrite private key even if it exists on the specified path]' \
'--force[Overwrite private key even if it exists on the specified path]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__signer__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-signer-help-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
'-s+[Shell to generate a completion script for.]:SHELL:(bash elvish fish powershell zsh)' \
'--shell=[Shell to generate a completion script for.]:SHELL:(bash elvish fish powershell zsh)' \
'-o+[Output file for the shell completions. By default the completions are printed to stdout]:OUTPUT:_files' \
'--output=[Output file for the shell completions. By default the completions are printed to stdout]:OUTPUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'--description=[Permission description]:DESCRIPTION: ' \
'*-a+[List of commands to allow]:ALLOW: ' \
'*--allow=[List of commands to allow]:ALLOW: ' \
'*-d+[List of commands to deny]:DENY: ' \
'*--deny=[List of commands to deny]:DENY: ' \
'--format=[Output file format]:FORMAT:(json toml)' \
'-o+[The output file]:OUT:_files' \
'--out=[The output file]:OUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::identifier -- Permission identifier:' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':identifier -- Permission to add:' \
'::capability -- Capability to add the permission to:' \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':identifier -- Permission to remove:' \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
'-f+[Permission identifier filter]:FILTER: ' \
'--filter=[Permission identifier filter]:FILTER: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin -- Name of the plugin to list permissions:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__permission__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-permission-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'--description=[Capability description]:DESCRIPTION: ' \
'*--windows=[Capability windows]:WINDOWS: ' \
'*--permission=[Capability permissions]:PERMISSION: ' \
'--format=[Output file format]:FORMAT:(json toml)' \
'-o+[The output file]:OUT:_files' \
'--out=[The output file]:OUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::identifier -- Capability identifier:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__capability__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-capability-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__inspect__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-inspect-help-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_yarn__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:yarn-help-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
":: :_yarn__help__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:yarn-help-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_yarn__help__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:yarn-help-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_yarn__help__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:yarn-help-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_yarn__help__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:yarn-help-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_yarn__help__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:yarn-help-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_yarn__help__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:yarn-help-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_yarn__help__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:yarn-help-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_yarn__help__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:yarn-help-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_yarn__help__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:yarn-help-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_yarn_commands] )) ||
_yarn_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'yarn commands' commands "$@"
}
(( $+functions[_npm__run__tauri_commands] )) ||
_npm__run__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri commands' commands "$@"
}
(( $+functions[_npm__run__tauri__add_commands] )) ||
_npm__run__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android_commands] )) ||
_npm__run__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__android-studio-script_commands] )) ||
_npm__run__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__build_commands] )) ||
_npm__run__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__dev_commands] )) ||
_npm__run__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help_commands] )) ||
_npm__run__tauri__android__help_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri android help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__android-studio-script_commands] )) ||
_npm__run__tauri__android__help__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__build_commands] )) ||
_npm__run__tauri__android__help__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__dev_commands] )) ||
_npm__run__tauri__android__help__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__help_commands] )) ||
_npm__run__tauri__android__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__init_commands] )) ||
_npm__run__tauri__android__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__init_commands] )) ||
_npm__run__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__build_commands] )) ||
_npm__run__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__bundle_commands] )) ||
_npm__run__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri bundle commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability_commands] )) ||
_npm__run__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri capability commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help_commands] )) ||
_npm__run__tauri__capability__help_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri capability help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help__help_commands] )) ||
_npm__run__tauri__capability__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help__new_commands] )) ||
_npm__run__tauri__capability__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__new_commands] )) ||
_npm__run__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__completions_commands] )) ||
_npm__run__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri completions commands' commands "$@"
}
(( $+functions[_npm__run__tauri__dev_commands] )) ||
_npm__run__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help_commands] )) ||
_npm__run__tauri__help_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__add_commands] )) ||
_npm__run__tauri__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android_commands] )) ||
_npm__run__tauri__help__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'npm run tauri help android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__android-studio-script_commands] )) ||
_npm__run__tauri__help__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__build_commands] )) ||
_npm__run__tauri__help__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__dev_commands] )) ||
_npm__run__tauri__help__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__init_commands] )) ||
_npm__run__tauri__help__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__build_commands] )) ||
_npm__run__tauri__help__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__bundle_commands] )) ||
_npm__run__tauri__help__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help bundle commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__capability_commands] )) ||
_npm__run__tauri__help__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'npm run tauri help capability commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__capability__new_commands] )) ||
_npm__run__tauri__help__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help capability new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__completions_commands] )) ||
_npm__run__tauri__help__completions_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help completions commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__dev_commands] )) ||
_npm__run__tauri__help__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__help_commands] )) ||
_npm__run__tauri__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__icon_commands] )) ||
_npm__run__tauri__help__icon_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help icon commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__info_commands] )) ||
_npm__run__tauri__help__info_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help info commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__init_commands] )) ||
_npm__run__tauri__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__inspect_commands] )) ||
_npm__run__tauri__help__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'npm run tauri help inspect commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__inspect__wix-upgrade-code_commands] )) ||
_npm__run__tauri__help__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__migrate_commands] )) ||
_npm__run__tauri__help__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help migrate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission_commands] )) ||
_npm__run__tauri__help__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'npm run tauri help permission commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__add_commands] )) ||
_npm__run__tauri__help__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__ls_commands] )) ||
_npm__run__tauri__help__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__new_commands] )) ||
_npm__run__tauri__help__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__rm_commands] )) ||
_npm__run__tauri__help__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin_commands] )) ||
_npm__run__tauri__help__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__android_commands] )) ||
_npm__run__tauri__help__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__android__init_commands] )) ||
_npm__run__tauri__help__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__init_commands] )) ||
_npm__run__tauri__help__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__ios_commands] )) ||
_npm__run__tauri__help__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__ios__init_commands] )) ||
_npm__run__tauri__help__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__new_commands] )) ||
_npm__run__tauri__help__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer_commands] )) ||
_npm__run__tauri__help__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'npm run tauri help signer commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer__generate_commands] )) ||
_npm__run__tauri__help__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help signer generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer__sign_commands] )) ||
_npm__run__tauri__help__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help signer sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri__icon_commands] )) ||
_npm__run__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri icon commands' commands "$@"
}
(( $+functions[_npm__run__tauri__info_commands] )) ||
_npm__run__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri info commands' commands "$@"
}
(( $+functions[_npm__run__tauri__init_commands] )) ||
_npm__run__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect_commands] )) ||
_npm__run__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri inspect commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help_commands] )) ||
_npm__run__tauri__inspect__help_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri inspect help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help__help_commands] )) ||
_npm__run__tauri__inspect__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help__wix-upgrade-code_commands] )) ||
_npm__run__tauri__inspect__help__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect help wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__wix-upgrade-code_commands] )) ||
_npm__run__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__migrate_commands] )) ||
_npm__run__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri migrate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission_commands] )) ||
_npm__run__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri permission commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__add_commands] )) ||
_npm__run__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help_commands] )) ||
_npm__run__tauri__permission__help_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri permission help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__add_commands] )) ||
_npm__run__tauri__permission__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__help_commands] )) ||
_npm__run__tauri__permission__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__ls_commands] )) ||
_npm__run__tauri__permission__help__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__new_commands] )) ||
_npm__run__tauri__permission__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__rm_commands] )) ||
_npm__run__tauri__permission__help__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__ls_commands] )) ||
_npm__run__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__new_commands] )) ||
_npm__run__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__rm_commands] )) ||
_npm__run__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin_commands] )) ||
_npm__run__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android_commands] )) ||
_npm__run__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help_commands] )) ||
_npm__run__tauri__plugin__android__help_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin android help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help__help_commands] )) ||
_npm__run__tauri__plugin__android__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help__init_commands] )) ||
_npm__run__tauri__plugin__android__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__init_commands] )) ||
_npm__run__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help_commands] )) ||
_npm__run__tauri__plugin__help_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__android_commands] )) ||
_npm__run__tauri__plugin__help__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri plugin help android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__android__init_commands] )) ||
_npm__run__tauri__plugin__help__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__help_commands] )) ||
_npm__run__tauri__plugin__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__init_commands] )) ||
_npm__run__tauri__plugin__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__ios_commands] )) ||
_npm__run__tauri__plugin__help__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri plugin help ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__ios__init_commands] )) ||
_npm__run__tauri__plugin__help__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__new_commands] )) ||
_npm__run__tauri__plugin__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__init_commands] )) ||
_npm__run__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios_commands] )) ||
_npm__run__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help_commands] )) ||
_npm__run__tauri__plugin__ios__help_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin ios help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help__help_commands] )) ||
_npm__run__tauri__plugin__ios__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help__init_commands] )) ||
_npm__run__tauri__plugin__ios__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__init_commands] )) ||
_npm__run__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__new_commands] )) ||
_npm__run__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer_commands] )) ||
_npm__run__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri signer commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__generate_commands] )) ||
_npm__run__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help_commands] )) ||
_npm__run__tauri__signer__help_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri signer help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__generate_commands] )) ||
_npm__run__tauri__signer__help__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__help_commands] )) ||
_npm__run__tauri__signer__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__sign_commands] )) ||
_npm__run__tauri__signer__help__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__sign_commands] )) ||
_npm__run__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer sign commands' commands "$@"
}
(( $+functions[_yarn__help_commands] )) ||
_yarn__help_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'yarn help commands' commands "$@"
}
(( $+functions[_yarn__help__help_commands] )) ||
_yarn__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help help commands' commands "$@"
}
(( $+functions[_yarn__help__tauri_commands] )) ||
_yarn__help__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
    )
    _describe -t commands 'yarn help tauri commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__add_commands] )) ||
_yarn__help__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri add commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__android_commands] )) ||
_yarn__help__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'yarn help tauri android commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__android__android-studio-script_commands] )) ||
_yarn__help__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__android__build_commands] )) ||
_yarn__help__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri android build commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__android__dev_commands] )) ||
_yarn__help__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri android dev commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__android__init_commands] )) ||
_yarn__help__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri android init commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__build_commands] )) ||
_yarn__help__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri build commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__bundle_commands] )) ||
_yarn__help__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri bundle commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__capability_commands] )) ||
_yarn__help__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'yarn help tauri capability commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__capability__new_commands] )) ||
_yarn__help__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri capability new commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__completions_commands] )) ||
_yarn__help__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri completions commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__dev_commands] )) ||
_yarn__help__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri dev commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__icon_commands] )) ||
_yarn__help__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri icon commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__info_commands] )) ||
_yarn__help__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri info commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__init_commands] )) ||
_yarn__help__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri init commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__inspect_commands] )) ||
_yarn__help__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'yarn help tauri inspect commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__inspect__wix-upgrade-code_commands] )) ||
_yarn__help__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__migrate_commands] )) ||
_yarn__help__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri migrate commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__permission_commands] )) ||
_yarn__help__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'yarn help tauri permission commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__permission__add_commands] )) ||
_yarn__help__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri permission add commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__permission__ls_commands] )) ||
_yarn__help__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri permission ls commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__permission__new_commands] )) ||
_yarn__help__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri permission new commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__permission__rm_commands] )) ||
_yarn__help__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri permission rm commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__plugin_commands] )) ||
_yarn__help__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'yarn help tauri plugin commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__plugin__android_commands] )) ||
_yarn__help__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'yarn help tauri plugin android commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__plugin__android__init_commands] )) ||
_yarn__help__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri plugin android init commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__plugin__init_commands] )) ||
_yarn__help__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri plugin init commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__plugin__ios_commands] )) ||
_yarn__help__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'yarn help tauri plugin ios commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__plugin__ios__init_commands] )) ||
_yarn__help__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri plugin ios init commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__plugin__new_commands] )) ||
_yarn__help__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri plugin new commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__signer_commands] )) ||
_yarn__help__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'yarn help tauri signer commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__signer__generate_commands] )) ||
_yarn__help__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri signer generate commands' commands "$@"
}
(( $+functions[_yarn__help__tauri__signer__sign_commands] )) ||
_yarn__help__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'yarn help tauri signer sign commands' commands "$@"
}

if [ "$funcstack[1]" = "_yarn" ]; then
    _yarn "$@"
else
    compdef _yarn yarn
fi

#compdef bun

autoload -U is-at-least

_bun() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_bun_commands" \
"*::: :->bun" \
&& ret=0
    case $state in
    (bun)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-command-$line[1]:"
        case $line[1] in
            (run)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_bun__run_commands" \
"*::: :->run" \
&& ret=0

    case $state in
    (run)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-run-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'-A+[Name of your Tauri application]:APP_NAME: ' \
'--app-name=[Name of your Tauri application]:APP_NAME: ' \
'-W+[Window title of your Tauri application]:WINDOW_TITLE: ' \
'--window-title=[Window title of your Tauri application]:WINDOW_TITLE: ' \
'-D+[Web assets location, relative to <project-dir>/src-tauri]:FRONTEND_DIST: ' \
'--frontend-dist=[Web assets location, relative to <project-dir>/src-tauri]:FRONTEND_DIST: ' \
'-P+[Url of your dev server]:DEV_URL: ' \
'--dev-url=[Url of your dev server]:DEV_URL: ' \
'--before-dev-command=[A shell command to run before \`tauri dev\` kicks in]:BEFORE_DEV_COMMAND: ' \
'--before-build-command=[A shell command to run before \`tauri build\` kicks in]:BEFORE_BUILD_COMMAND: ' \
'--ci[Skip prompting for values]' \
'-f[Force init to overwrite the src-tauri folder]' \
'--force[Force init to overwrite the src-tauri folder]' \
'-l[Enables logging]' \
'--log[Enables logging]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
'-r+[Binary to use to run the application]:RUNNER: ' \
'--runner=[Binary to use to run the application]:RUNNER: ' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--port=[Specify port for the built-in dev server for static files. Defaults to 1430]:PORT: ' \
'-e[Exit on panic]' \
'--exit-on-panic[Exit on panic]' \
'--release[Run the code in release mode]' \
'--no-dev-server-wait[Skip waiting for the frontend dev server to start before building the tauri application]' \
'--no-watch[Disable the file watcher]' \
'--no-dev-server[Disable the built-in dev server for static files]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'*::args -- Command line arguments passed to the runner. Use `--` to explicitly mark the start of the arguments. Arguments after a second `--` are passed to the application e.g. `tauri dev -- \[runnerArgs\] -- \[appArgs\]`:' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
'-r+[Binary to use to build the application, defaults to \`cargo\`]:RUNNER: ' \
'--runner=[Binary to use to build the application, defaults to \`cargo\`]:RUNNER: ' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'*-f+[Space or comma separated list of features to activate]' \
'*--features=[Space or comma separated list of features to activate]' \
'*-b+[Space or comma separated list of bundles to package]' \
'*--bundles=[Space or comma separated list of bundles to package]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--no-bundle[Skip the bundling step even if \`bundle > active\` is \`true\` in tauri config]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'*::args -- Command line arguments passed to the runner. Use `--` to explicitly mark the start of the arguments:' \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
'*-b+[Space or comma separated list of bundles to package]' \
'*--bundles=[Space or comma separated list of bundles to package]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'*-f+[Space or comma separated list of features, should be the same features passed to \`tauri build\` if any]' \
'*--features=[Space or comma separated list of features, should be the same features passed to \`tauri build\` if any]' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'--ci[Skip prompting for values]' \
'--skip-targets-install[Skips installing rust toolchains via rustup]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--host=[Use the public network address for the development server. If an actual address it provided, it is used instead of prompting to pick one]' \
'--port=[Specify port for the built-in dev server for static files. Defaults to 1430]:PORT: ' \
'-e[Exit on panic]' \
'--exit-on-panic[Exit on panic]' \
'--release[Run the code in release mode]' \
'--no-dev-server-wait[Skip waiting for the frontend dev server to start before building the tauri application]' \
'--no-watch[Disable the file watcher]' \
'-o[Open Android Studio instead of trying to run on a connected device]' \
'--open[Open Android Studio instead of trying to run on a connected device]' \
'--force-ip-prompt[Force prompting for an IP to use to connect to the dev server on mobile]' \
'--no-dev-server[Disable the built-in dev server for static files]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::device -- Runs on the given device name:' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
'*-t+[Which targets to build (all by default)]' \
'*--target=[Which targets to build (all by default)]' \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--split-per-abi[Whether to split the APKs and AABs per ABIs]' \
'--apk[Build APKs]' \
'--aab[Build AABs]' \
'-o[Open Android Studio]' \
'--open[Open Android Studio]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
'*-t+[Targets to build]' \
'*--target=[Targets to build]' \
'-r[Builds with the release flag]' \
'--release[Builds with the release flag]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__android__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-android-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
'--interactive[Interactive mode to apply automatic fixes]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'-t+[Git tag to use]:TAG: ' \
'--tag=[Git tag to use]:TAG: ' \
'-r+[Git rev to use]:REV: ' \
'--rev=[Git rev to use]:REV: ' \
'-b+[Git branch to use]:BRANCH: ' \
'--branch=[Git branch to use]:BRANCH: ' \
'--no-fmt[Don'\''t format code with rustfmt]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':plugin -- The plugin to add:' \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-a+[Author name]:AUTHOR: ' \
'--author=[Author name]:AUTHOR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--no-api[Initializes a Tauri plugin without the TypeScript API]' \
'--no-example[Initialize without an example project]' \
'--android[Whether to initialize an Android project for the plugin]' \
'--ios[Whether to initialize an iOS project for the plugin]' \
'--mobile[Whether to initialize Android and iOS projects for the plugin]' \
'--github-workflows[Generate github workflows]' \
'--tauri[Initializes a Tauri core plugin (internal usage)]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
':plugin_name -- Name of your Tauri plugin:' \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-a+[Author name]:AUTHOR: ' \
'--author=[Author name]:AUTHOR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--no-api[Initializes a Tauri plugin without the TypeScript API]' \
'--no-example[Initialize without an example project]' \
'--android[Whether to initialize an Android project for the plugin]' \
'--ios[Whether to initialize an iOS project for the plugin]' \
'--mobile[Whether to initialize Android and iOS projects for the plugin]' \
'--github-workflows[Generate github workflows]' \
'--tauri[Initializes a Tauri core plugin (internal usage)]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-o+[The output directory]:OUT_DIR: ' \
'--out-dir=[The output directory]:OUT_DIR: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. Must match the current plugin'\''s name. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__android__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-android-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-o+[The output directory]:OUT_DIR: ' \
'--out-dir=[The output directory]:OUT_DIR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. Must match the current plugin'\''s name. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__ios__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-ios-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
'-o+[Output directory. Default\: '\''icons'\'' directory next to the tauri.conf.json file]:OUTPUT:_files' \
'--output=[Output directory. Default\: '\''icons'\'' directory next to the tauri.conf.json file]:OUTPUT:_files' \
'*-p+[Custom PNG icon sizes to generate. When set, the default icons are not generated]:PNG: ' \
'*--png=[Custom PNG icon sizes to generate. When set, the default icons are not generated]:PNG: ' \
'--ios-color=[The background color of the iOS icon - string as defined in the W3C'\''s CSS Color Module Level 4 <https\://www.w3.org/TR/css-color-4/>]:IOS_COLOR: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::input -- Path to the source icon (squared PNG or SVG file with transparency):_files' \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
'(-f --private-key-path)-k+[Load the private key from a string]:PRIVATE_KEY: ' \
'(-f --private-key-path)--private-key=[Load the private key from a string]:PRIVATE_KEY: ' \
'(-k --private-key)-f+[Load the private key from a file]:PRIVATE_KEY_PATH:_files' \
'(-k --private-key)--private-key-path=[Load the private key from a file]:PRIVATE_KEY_PATH:_files' \
'-p+[Set private key password when signing]:PASSWORD: ' \
'--password=[Set private key password when signing]:PASSWORD: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':file -- Sign the specified file:_files' \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
'-p+[Set private key password when signing]:PASSWORD: ' \
'--password=[Set private key password when signing]:PASSWORD: ' \
'-w+[Write private key to a file]:WRITE_KEYS:_files' \
'--write-keys=[Write private key to a file]:WRITE_KEYS:_files' \
'-f[Overwrite private key even if it exists on the specified path]' \
'--force[Overwrite private key even if it exists on the specified path]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__signer__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-signer-help-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
'-s+[Shell to generate a completion script for.]:SHELL:(bash elvish fish powershell zsh)' \
'--shell=[Shell to generate a completion script for.]:SHELL:(bash elvish fish powershell zsh)' \
'-o+[Output file for the shell completions. By default the completions are printed to stdout]:OUTPUT:_files' \
'--output=[Output file for the shell completions. By default the completions are printed to stdout]:OUTPUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'--description=[Permission description]:DESCRIPTION: ' \
'*-a+[List of commands to allow]:ALLOW: ' \
'*--allow=[List of commands to allow]:ALLOW: ' \
'*-d+[List of commands to deny]:DENY: ' \
'*--deny=[List of commands to deny]:DENY: ' \
'--format=[Output file format]:FORMAT:(json toml)' \
'-o+[The output file]:OUT:_files' \
'--out=[The output file]:OUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::identifier -- Permission identifier:' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':identifier -- Permission to add:' \
'::capability -- Capability to add the permission to:' \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':identifier -- Permission to remove:' \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
'-f+[Permission identifier filter]:FILTER: ' \
'--filter=[Permission identifier filter]:FILTER: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin -- Name of the plugin to list permissions:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__permission__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-permission-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'--description=[Capability description]:DESCRIPTION: ' \
'*--windows=[Capability windows]:WINDOWS: ' \
'*--permission=[Capability permissions]:PERMISSION: ' \
'--format=[Output file format]:FORMAT:(json toml)' \
'-o+[The output file]:OUT:_files' \
'--out=[The output file]:OUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::identifier -- Capability identifier:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__capability__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-capability-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__inspect__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-inspect-help-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_bun__run__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-run-help-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
":: :_bun__run__help__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-run-help-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_bun__run__help__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-run-help-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_bun__run__help__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-run-help-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_bun__run__help__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-run-help-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_bun__run__help__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-run-help-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_bun__run__help__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-run-help-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_bun__run__help__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-run-help-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_bun__run__help__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-run-help-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_bun__run__help__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-run-help-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_bun__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-help-command-$line[1]:"
        case $line[1] in
            (run)
_arguments "${_arguments_options[@]}" : \
":: :_bun__help__run_commands" \
"*::: :->run" \
&& ret=0

    case $state in
    (run)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-help-run-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
":: :_bun__help__run__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-help-run-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_bun__help__run__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-help-run-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_bun__help__run__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-help-run-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_bun__help__run__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-help-run-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_bun__help__run__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-help-run-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_bun__help__run__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-help-run-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_bun__help__run__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-help-run-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_bun__help__run__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-help-run-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_bun__help__run__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:bun-help-run-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_bun_commands] )) ||
_bun_commands() {
    local commands; commands=(
'run:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'bun commands' commands "$@"
}
(( $+functions[_bun__help_commands] )) ||
_bun__help_commands() {
    local commands; commands=(
'run:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'bun help commands' commands "$@"
}
(( $+functions[_bun__help__help_commands] )) ||
_bun__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'bun help help commands' commands "$@"
}
(( $+functions[_bun__help__run_commands] )) ||
_bun__help__run_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
    )
    _describe -t commands 'bun help run commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri_commands] )) ||
_bun__help__run__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
    )
    _describe -t commands 'bun help run tauri commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__add_commands] )) ||
_bun__help__run__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri add commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__android_commands] )) ||
_bun__help__run__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'bun help run tauri android commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__android__android-studio-script_commands] )) ||
_bun__help__run__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__android__build_commands] )) ||
_bun__help__run__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri android build commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__android__dev_commands] )) ||
_bun__help__run__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri android dev commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__android__init_commands] )) ||
_bun__help__run__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri android init commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__build_commands] )) ||
_bun__help__run__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri build commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__bundle_commands] )) ||
_bun__help__run__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri bundle commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__capability_commands] )) ||
_bun__help__run__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'bun help run tauri capability commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__capability__new_commands] )) ||
_bun__help__run__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri capability new commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__completions_commands] )) ||
_bun__help__run__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri completions commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__dev_commands] )) ||
_bun__help__run__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri dev commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__icon_commands] )) ||
_bun__help__run__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri icon commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__info_commands] )) ||
_bun__help__run__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri info commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__init_commands] )) ||
_bun__help__run__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri init commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__inspect_commands] )) ||
_bun__help__run__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'bun help run tauri inspect commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__inspect__wix-upgrade-code_commands] )) ||
_bun__help__run__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__migrate_commands] )) ||
_bun__help__run__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri migrate commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__permission_commands] )) ||
_bun__help__run__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'bun help run tauri permission commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__permission__add_commands] )) ||
_bun__help__run__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri permission add commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__permission__ls_commands] )) ||
_bun__help__run__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri permission ls commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__permission__new_commands] )) ||
_bun__help__run__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri permission new commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__permission__rm_commands] )) ||
_bun__help__run__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri permission rm commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__plugin_commands] )) ||
_bun__help__run__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'bun help run tauri plugin commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__plugin__android_commands] )) ||
_bun__help__run__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'bun help run tauri plugin android commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__plugin__android__init_commands] )) ||
_bun__help__run__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri plugin android init commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__plugin__init_commands] )) ||
_bun__help__run__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri plugin init commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__plugin__ios_commands] )) ||
_bun__help__run__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'bun help run tauri plugin ios commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__plugin__ios__init_commands] )) ||
_bun__help__run__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri plugin ios init commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__plugin__new_commands] )) ||
_bun__help__run__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri plugin new commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__signer_commands] )) ||
_bun__help__run__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'bun help run tauri signer commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__signer__generate_commands] )) ||
_bun__help__run__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri signer generate commands' commands "$@"
}
(( $+functions[_bun__help__run__tauri__signer__sign_commands] )) ||
_bun__help__run__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'bun help run tauri signer sign commands' commands "$@"
}
(( $+functions[_bun__run_commands] )) ||
_bun__run_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'bun run commands' commands "$@"
}
(( $+functions[_bun__run__help_commands] )) ||
_bun__run__help_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'bun run help commands' commands "$@"
}
(( $+functions[_bun__run__help__help_commands] )) ||
_bun__run__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help help commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri_commands] )) ||
_bun__run__help__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
    )
    _describe -t commands 'bun run help tauri commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__add_commands] )) ||
_bun__run__help__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri add commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__android_commands] )) ||
_bun__run__help__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'bun run help tauri android commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__android__android-studio-script_commands] )) ||
_bun__run__help__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__android__build_commands] )) ||
_bun__run__help__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri android build commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__android__dev_commands] )) ||
_bun__run__help__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri android dev commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__android__init_commands] )) ||
_bun__run__help__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri android init commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__build_commands] )) ||
_bun__run__help__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri build commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__bundle_commands] )) ||
_bun__run__help__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri bundle commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__capability_commands] )) ||
_bun__run__help__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'bun run help tauri capability commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__capability__new_commands] )) ||
_bun__run__help__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri capability new commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__completions_commands] )) ||
_bun__run__help__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri completions commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__dev_commands] )) ||
_bun__run__help__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri dev commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__icon_commands] )) ||
_bun__run__help__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri icon commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__info_commands] )) ||
_bun__run__help__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri info commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__init_commands] )) ||
_bun__run__help__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri init commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__inspect_commands] )) ||
_bun__run__help__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'bun run help tauri inspect commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__inspect__wix-upgrade-code_commands] )) ||
_bun__run__help__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__migrate_commands] )) ||
_bun__run__help__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri migrate commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__permission_commands] )) ||
_bun__run__help__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'bun run help tauri permission commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__permission__add_commands] )) ||
_bun__run__help__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri permission add commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__permission__ls_commands] )) ||
_bun__run__help__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri permission ls commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__permission__new_commands] )) ||
_bun__run__help__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri permission new commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__permission__rm_commands] )) ||
_bun__run__help__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri permission rm commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__plugin_commands] )) ||
_bun__run__help__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'bun run help tauri plugin commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__plugin__android_commands] )) ||
_bun__run__help__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'bun run help tauri plugin android commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__plugin__android__init_commands] )) ||
_bun__run__help__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri plugin android init commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__plugin__init_commands] )) ||
_bun__run__help__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri plugin init commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__plugin__ios_commands] )) ||
_bun__run__help__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'bun run help tauri plugin ios commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__plugin__ios__init_commands] )) ||
_bun__run__help__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri plugin ios init commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__plugin__new_commands] )) ||
_bun__run__help__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri plugin new commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__signer_commands] )) ||
_bun__run__help__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'bun run help tauri signer commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__signer__generate_commands] )) ||
_bun__run__help__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri signer generate commands' commands "$@"
}
(( $+functions[_bun__run__help__tauri__signer__sign_commands] )) ||
_bun__run__help__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'bun run help tauri signer sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri_commands] )) ||
_npm__run__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri commands' commands "$@"
}
(( $+functions[_npm__run__tauri__add_commands] )) ||
_npm__run__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android_commands] )) ||
_npm__run__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__android-studio-script_commands] )) ||
_npm__run__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__build_commands] )) ||
_npm__run__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__dev_commands] )) ||
_npm__run__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help_commands] )) ||
_npm__run__tauri__android__help_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri android help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__android-studio-script_commands] )) ||
_npm__run__tauri__android__help__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__build_commands] )) ||
_npm__run__tauri__android__help__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__dev_commands] )) ||
_npm__run__tauri__android__help__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__help_commands] )) ||
_npm__run__tauri__android__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__init_commands] )) ||
_npm__run__tauri__android__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__init_commands] )) ||
_npm__run__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__build_commands] )) ||
_npm__run__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__bundle_commands] )) ||
_npm__run__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri bundle commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability_commands] )) ||
_npm__run__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri capability commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help_commands] )) ||
_npm__run__tauri__capability__help_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri capability help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help__help_commands] )) ||
_npm__run__tauri__capability__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help__new_commands] )) ||
_npm__run__tauri__capability__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__new_commands] )) ||
_npm__run__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__completions_commands] )) ||
_npm__run__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri completions commands' commands "$@"
}
(( $+functions[_npm__run__tauri__dev_commands] )) ||
_npm__run__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help_commands] )) ||
_npm__run__tauri__help_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__add_commands] )) ||
_npm__run__tauri__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android_commands] )) ||
_npm__run__tauri__help__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'npm run tauri help android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__android-studio-script_commands] )) ||
_npm__run__tauri__help__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__build_commands] )) ||
_npm__run__tauri__help__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__dev_commands] )) ||
_npm__run__tauri__help__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__init_commands] )) ||
_npm__run__tauri__help__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__build_commands] )) ||
_npm__run__tauri__help__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__bundle_commands] )) ||
_npm__run__tauri__help__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help bundle commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__capability_commands] )) ||
_npm__run__tauri__help__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'npm run tauri help capability commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__capability__new_commands] )) ||
_npm__run__tauri__help__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help capability new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__completions_commands] )) ||
_npm__run__tauri__help__completions_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help completions commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__dev_commands] )) ||
_npm__run__tauri__help__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__help_commands] )) ||
_npm__run__tauri__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__icon_commands] )) ||
_npm__run__tauri__help__icon_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help icon commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__info_commands] )) ||
_npm__run__tauri__help__info_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help info commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__init_commands] )) ||
_npm__run__tauri__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__inspect_commands] )) ||
_npm__run__tauri__help__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'npm run tauri help inspect commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__inspect__wix-upgrade-code_commands] )) ||
_npm__run__tauri__help__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__migrate_commands] )) ||
_npm__run__tauri__help__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help migrate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission_commands] )) ||
_npm__run__tauri__help__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'npm run tauri help permission commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__add_commands] )) ||
_npm__run__tauri__help__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__ls_commands] )) ||
_npm__run__tauri__help__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__new_commands] )) ||
_npm__run__tauri__help__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__rm_commands] )) ||
_npm__run__tauri__help__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin_commands] )) ||
_npm__run__tauri__help__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__android_commands] )) ||
_npm__run__tauri__help__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__android__init_commands] )) ||
_npm__run__tauri__help__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__init_commands] )) ||
_npm__run__tauri__help__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__ios_commands] )) ||
_npm__run__tauri__help__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__ios__init_commands] )) ||
_npm__run__tauri__help__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__new_commands] )) ||
_npm__run__tauri__help__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer_commands] )) ||
_npm__run__tauri__help__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'npm run tauri help signer commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer__generate_commands] )) ||
_npm__run__tauri__help__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help signer generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer__sign_commands] )) ||
_npm__run__tauri__help__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help signer sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri__icon_commands] )) ||
_npm__run__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri icon commands' commands "$@"
}
(( $+functions[_npm__run__tauri__info_commands] )) ||
_npm__run__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri info commands' commands "$@"
}
(( $+functions[_npm__run__tauri__init_commands] )) ||
_npm__run__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect_commands] )) ||
_npm__run__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri inspect commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help_commands] )) ||
_npm__run__tauri__inspect__help_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri inspect help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help__help_commands] )) ||
_npm__run__tauri__inspect__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help__wix-upgrade-code_commands] )) ||
_npm__run__tauri__inspect__help__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect help wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__wix-upgrade-code_commands] )) ||
_npm__run__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__migrate_commands] )) ||
_npm__run__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri migrate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission_commands] )) ||
_npm__run__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri permission commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__add_commands] )) ||
_npm__run__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help_commands] )) ||
_npm__run__tauri__permission__help_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri permission help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__add_commands] )) ||
_npm__run__tauri__permission__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__help_commands] )) ||
_npm__run__tauri__permission__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__ls_commands] )) ||
_npm__run__tauri__permission__help__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__new_commands] )) ||
_npm__run__tauri__permission__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__rm_commands] )) ||
_npm__run__tauri__permission__help__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__ls_commands] )) ||
_npm__run__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__new_commands] )) ||
_npm__run__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__rm_commands] )) ||
_npm__run__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin_commands] )) ||
_npm__run__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android_commands] )) ||
_npm__run__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help_commands] )) ||
_npm__run__tauri__plugin__android__help_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin android help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help__help_commands] )) ||
_npm__run__tauri__plugin__android__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help__init_commands] )) ||
_npm__run__tauri__plugin__android__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__init_commands] )) ||
_npm__run__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help_commands] )) ||
_npm__run__tauri__plugin__help_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__android_commands] )) ||
_npm__run__tauri__plugin__help__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri plugin help android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__android__init_commands] )) ||
_npm__run__tauri__plugin__help__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__help_commands] )) ||
_npm__run__tauri__plugin__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__init_commands] )) ||
_npm__run__tauri__plugin__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__ios_commands] )) ||
_npm__run__tauri__plugin__help__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri plugin help ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__ios__init_commands] )) ||
_npm__run__tauri__plugin__help__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__new_commands] )) ||
_npm__run__tauri__plugin__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__init_commands] )) ||
_npm__run__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios_commands] )) ||
_npm__run__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help_commands] )) ||
_npm__run__tauri__plugin__ios__help_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin ios help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help__help_commands] )) ||
_npm__run__tauri__plugin__ios__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help__init_commands] )) ||
_npm__run__tauri__plugin__ios__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__init_commands] )) ||
_npm__run__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__new_commands] )) ||
_npm__run__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer_commands] )) ||
_npm__run__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri signer commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__generate_commands] )) ||
_npm__run__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help_commands] )) ||
_npm__run__tauri__signer__help_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri signer help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__generate_commands] )) ||
_npm__run__tauri__signer__help__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__help_commands] )) ||
_npm__run__tauri__signer__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__sign_commands] )) ||
_npm__run__tauri__signer__help__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__sign_commands] )) ||
_npm__run__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer sign commands' commands "$@"
}

if [ "$funcstack[1]" = "_bun" ]; then
    _bun "$@"
else
    compdef _bun bun
fi

#compdef deno

autoload -U is-at-least

_deno() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_deno_commands" \
"*::: :->deno" \
&& ret=0
    case $state in
    (deno)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-command-$line[1]:"
        case $line[1] in
            (task)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_deno__task_commands" \
"*::: :->task" \
&& ret=0

    case $state in
    (task)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-task-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'-A+[Name of your Tauri application]:APP_NAME: ' \
'--app-name=[Name of your Tauri application]:APP_NAME: ' \
'-W+[Window title of your Tauri application]:WINDOW_TITLE: ' \
'--window-title=[Window title of your Tauri application]:WINDOW_TITLE: ' \
'-D+[Web assets location, relative to <project-dir>/src-tauri]:FRONTEND_DIST: ' \
'--frontend-dist=[Web assets location, relative to <project-dir>/src-tauri]:FRONTEND_DIST: ' \
'-P+[Url of your dev server]:DEV_URL: ' \
'--dev-url=[Url of your dev server]:DEV_URL: ' \
'--before-dev-command=[A shell command to run before \`tauri dev\` kicks in]:BEFORE_DEV_COMMAND: ' \
'--before-build-command=[A shell command to run before \`tauri build\` kicks in]:BEFORE_BUILD_COMMAND: ' \
'--ci[Skip prompting for values]' \
'-f[Force init to overwrite the src-tauri folder]' \
'--force[Force init to overwrite the src-tauri folder]' \
'-l[Enables logging]' \
'--log[Enables logging]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
'-r+[Binary to use to run the application]:RUNNER: ' \
'--runner=[Binary to use to run the application]:RUNNER: ' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--port=[Specify port for the built-in dev server for static files. Defaults to 1430]:PORT: ' \
'-e[Exit on panic]' \
'--exit-on-panic[Exit on panic]' \
'--release[Run the code in release mode]' \
'--no-dev-server-wait[Skip waiting for the frontend dev server to start before building the tauri application]' \
'--no-watch[Disable the file watcher]' \
'--no-dev-server[Disable the built-in dev server for static files]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'*::args -- Command line arguments passed to the runner. Use `--` to explicitly mark the start of the arguments. Arguments after a second `--` are passed to the application e.g. `tauri dev -- \[runnerArgs\] -- \[appArgs\]`:' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
'-r+[Binary to use to build the application, defaults to \`cargo\`]:RUNNER: ' \
'--runner=[Binary to use to build the application, defaults to \`cargo\`]:RUNNER: ' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'*-f+[Space or comma separated list of features to activate]' \
'*--features=[Space or comma separated list of features to activate]' \
'*-b+[Space or comma separated list of bundles to package]' \
'*--bundles=[Space or comma separated list of bundles to package]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--no-bundle[Skip the bundling step even if \`bundle > active\` is \`true\` in tauri config]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'*::args -- Command line arguments passed to the runner. Use `--` to explicitly mark the start of the arguments:' \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
'*-b+[Space or comma separated list of bundles to package]' \
'*--bundles=[Space or comma separated list of bundles to package]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'*-f+[Space or comma separated list of features, should be the same features passed to \`tauri build\` if any]' \
'*--features=[Space or comma separated list of features, should be the same features passed to \`tauri build\` if any]' \
'-t+[Target triple to build against]:TARGET: ' \
'--target=[Target triple to build against]:TARGET: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'--ci[Skip prompting for values]' \
'--skip-targets-install[Skips installing rust toolchains via rustup]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--host=[Use the public network address for the development server. If an actual address it provided, it is used instead of prompting to pick one]' \
'--port=[Specify port for the built-in dev server for static files. Defaults to 1430]:PORT: ' \
'-e[Exit on panic]' \
'--exit-on-panic[Exit on panic]' \
'--release[Run the code in release mode]' \
'--no-dev-server-wait[Skip waiting for the frontend dev server to start before building the tauri application]' \
'--no-watch[Disable the file watcher]' \
'-o[Open Android Studio instead of trying to run on a connected device]' \
'--open[Open Android Studio instead of trying to run on a connected device]' \
'--force-ip-prompt[Force prompting for an IP to use to connect to the dev server on mobile]' \
'--no-dev-server[Disable the built-in dev server for static files]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::device -- Runs on the given device name:' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
'*-t+[Which targets to build (all by default)]' \
'*--target=[Which targets to build (all by default)]' \
'*-f+[List of cargo features to activate]' \
'*--features=[List of cargo features to activate]' \
'-c+[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'--config=[JSON string or path to JSON file to merge with tauri.conf.json]:CONFIG: ' \
'-d[Builds with the debug flag]' \
'--debug[Builds with the debug flag]' \
'--split-per-abi[Whether to split the APKs and AABs per ABIs]' \
'--apk[Build APKs]' \
'--aab[Build AABs]' \
'-o[Open Android Studio]' \
'--open[Open Android Studio]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
'*-t+[Targets to build]' \
'*--target=[Targets to build]' \
'-r[Builds with the release flag]' \
'--release[Builds with the release flag]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__android__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-android-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
'--interactive[Interactive mode to apply automatic fixes]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'-t+[Git tag to use]:TAG: ' \
'--tag=[Git tag to use]:TAG: ' \
'-r+[Git rev to use]:REV: ' \
'--rev=[Git rev to use]:REV: ' \
'-b+[Git branch to use]:BRANCH: ' \
'--branch=[Git branch to use]:BRANCH: ' \
'--no-fmt[Don'\''t format code with rustfmt]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':plugin -- The plugin to add:' \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-a+[Author name]:AUTHOR: ' \
'--author=[Author name]:AUTHOR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--no-api[Initializes a Tauri plugin without the TypeScript API]' \
'--no-example[Initialize without an example project]' \
'--android[Whether to initialize an Android project for the plugin]' \
'--ios[Whether to initialize an iOS project for the plugin]' \
'--mobile[Whether to initialize Android and iOS projects for the plugin]' \
'--github-workflows[Generate github workflows]' \
'--tauri[Initializes a Tauri core plugin (internal usage)]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
':plugin_name -- Name of your Tauri plugin:' \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
'-d+[Set target directory for init]:DIRECTORY: ' \
'--directory=[Set target directory for init]:DIRECTORY: ' \
'-a+[Author name]:AUTHOR: ' \
'--author=[Author name]:AUTHOR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'-t+[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--tauri-path=[Path of the Tauri project to use (relative to the cwd)]:TAURI_PATH:_files' \
'--no-api[Initializes a Tauri plugin without the TypeScript API]' \
'--no-example[Initialize without an example project]' \
'--android[Whether to initialize an Android project for the plugin]' \
'--ios[Whether to initialize an iOS project for the plugin]' \
'--mobile[Whether to initialize Android and iOS projects for the plugin]' \
'--github-workflows[Generate github workflows]' \
'--tauri[Initializes a Tauri core plugin (internal usage)]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-o+[The output directory]:OUT_DIR: ' \
'--out-dir=[The output directory]:OUT_DIR: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. Must match the current plugin'\''s name. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__android__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-android-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
'-o+[The output directory]:OUT_DIR: ' \
'--out-dir=[The output directory]:OUT_DIR: ' \
'--ios-framework=[Type of framework to use for the iOS project]:IOS_FRAMEWORK:((spm\:"Swift Package Manager project"
xcode\:"Xcode project"))' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin_name -- Name of your Tauri plugin. Must match the current plugin'\''s name. If not specified, it will be inferred from the current directory:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__ios__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-ios-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__plugin__help__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-plugin-help-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
'-o+[Output directory. Default\: '\''icons'\'' directory next to the tauri.conf.json file]:OUTPUT:_files' \
'--output=[Output directory. Default\: '\''icons'\'' directory next to the tauri.conf.json file]:OUTPUT:_files' \
'*-p+[Custom PNG icon sizes to generate. When set, the default icons are not generated]:PNG: ' \
'*--png=[Custom PNG icon sizes to generate. When set, the default icons are not generated]:PNG: ' \
'--ios-color=[The background color of the iOS icon - string as defined in the W3C'\''s CSS Color Module Level 4 <https\://www.w3.org/TR/css-color-4/>]:IOS_COLOR: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::input -- Path to the source icon (squared PNG or SVG file with transparency):_files' \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
'(-f --private-key-path)-k+[Load the private key from a string]:PRIVATE_KEY: ' \
'(-f --private-key-path)--private-key=[Load the private key from a string]:PRIVATE_KEY: ' \
'(-k --private-key)-f+[Load the private key from a file]:PRIVATE_KEY_PATH:_files' \
'(-k --private-key)--private-key-path=[Load the private key from a file]:PRIVATE_KEY_PATH:_files' \
'-p+[Set private key password when signing]:PASSWORD: ' \
'--password=[Set private key password when signing]:PASSWORD: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':file -- Sign the specified file:_files' \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
'-p+[Set private key password when signing]:PASSWORD: ' \
'--password=[Set private key password when signing]:PASSWORD: ' \
'-w+[Write private key to a file]:WRITE_KEYS:_files' \
'--write-keys=[Write private key to a file]:WRITE_KEYS:_files' \
'-f[Overwrite private key even if it exists on the specified path]' \
'--force[Overwrite private key even if it exists on the specified path]' \
'--ci[Skip prompting for values]' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__signer__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-signer-help-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
'-s+[Shell to generate a completion script for.]:SHELL:(bash elvish fish powershell zsh)' \
'--shell=[Shell to generate a completion script for.]:SHELL:(bash elvish fish powershell zsh)' \
'-o+[Output file for the shell completions. By default the completions are printed to stdout]:OUTPUT:_files' \
'--output=[Output file for the shell completions. By default the completions are printed to stdout]:OUTPUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'--description=[Permission description]:DESCRIPTION: ' \
'*-a+[List of commands to allow]:ALLOW: ' \
'*--allow=[List of commands to allow]:ALLOW: ' \
'*-d+[List of commands to deny]:DENY: ' \
'*--deny=[List of commands to deny]:DENY: ' \
'--format=[Output file format]:FORMAT:(json toml)' \
'-o+[The output file]:OUT:_files' \
'--out=[The output file]:OUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::identifier -- Permission identifier:' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':identifier -- Permission to add:' \
'::capability -- Capability to add the permission to:' \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':identifier -- Permission to remove:' \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
'-f+[Permission identifier filter]:FILTER: ' \
'--filter=[Permission identifier filter]:FILTER: ' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::plugin -- Name of the plugin to list permissions:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__permission__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-permission-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
'--description=[Capability description]:DESCRIPTION: ' \
'*--windows=[Capability windows]:WINDOWS: ' \
'*--permission=[Capability permissions]:PERMISSION: ' \
'--format=[Output file format]:FORMAT:(json toml)' \
'-o+[The output file]:OUT:_files' \
'--out=[The output file]:OUT:_files' \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::identifier -- Capability identifier:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__capability__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-capability-help-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_npm__run__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
'*-v[Enables verbose logging]' \
'*--verbose[Enables verbose logging]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__inspect__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-inspect-help-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_npm__run__tauri__help__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:npm-run-tauri-help-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_deno__task__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-task-help-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
":: :_deno__task__help__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-task-help-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_deno__task__help__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-task-help-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_deno__task__help__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-task-help-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_deno__task__help__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-task-help-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_deno__task__help__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-task-help-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_deno__task__help__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-task-help-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_deno__task__help__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-task-help-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_deno__task__help__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-task-help-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_deno__task__help__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-task-help-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_deno__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-help-command-$line[1]:"
        case $line[1] in
            (task)
_arguments "${_arguments_options[@]}" : \
":: :_deno__help__task_commands" \
"*::: :->task" \
&& ret=0

    case $state in
    (task)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-help-task-command-$line[1]:"
        case $line[1] in
            (tauri)
_arguments "${_arguments_options[@]}" : \
":: :_deno__help__task__tauri_commands" \
"*::: :->tauri" \
&& ret=0

    case $state in
    (tauri)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-help-task-tauri-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(bundle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_deno__help__task__tauri__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-help-task-tauri-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(dev)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android-studio-script)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(plugin)
_arguments "${_arguments_options[@]}" : \
":: :_deno__help__task__tauri__plugin_commands" \
"*::: :->plugin" \
&& ret=0

    case $state in
    (plugin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-help-task-tauri-plugin-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(android)
_arguments "${_arguments_options[@]}" : \
":: :_deno__help__task__tauri__plugin__android_commands" \
"*::: :->android" \
&& ret=0

    case $state in
    (android)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-help-task-tauri-plugin-android-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(ios)
_arguments "${_arguments_options[@]}" : \
":: :_deno__help__task__tauri__plugin__ios_commands" \
"*::: :->ios" \
&& ret=0

    case $state in
    (ios)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-help-task-tauri-plugin-ios-command-$line[1]:"
        case $line[1] in
            (init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(icon)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(signer)
_arguments "${_arguments_options[@]}" : \
":: :_deno__help__task__tauri__signer_commands" \
"*::: :->signer" \
&& ret=0

    case $state in
    (signer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-help-task-tauri-signer-command-$line[1]:"
        case $line[1] in
            (sign)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(permission)
_arguments "${_arguments_options[@]}" : \
":: :_deno__help__task__tauri__permission_commands" \
"*::: :->permission" \
&& ret=0

    case $state in
    (permission)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-help-task-tauri-permission-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(capability)
_arguments "${_arguments_options[@]}" : \
":: :_deno__help__task__tauri__capability_commands" \
"*::: :->capability" \
&& ret=0

    case $state in
    (capability)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-help-task-tauri-capability-command-$line[1]:"
        case $line[1] in
            (new)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(inspect)
_arguments "${_arguments_options[@]}" : \
":: :_deno__help__task__tauri__inspect_commands" \
"*::: :->inspect" \
&& ret=0

    case $state in
    (inspect)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-help-task-tauri-inspect-command-$line[1]:"
        case $line[1] in
            (wix-upgrade-code)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_deno_commands] )) ||
_deno_commands() {
    local commands; commands=(
'task:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'deno commands' commands "$@"
}
(( $+functions[_deno__help_commands] )) ||
_deno__help_commands() {
    local commands; commands=(
'task:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'deno help commands' commands "$@"
}
(( $+functions[_deno__help__help_commands] )) ||
_deno__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'deno help help commands' commands "$@"
}
(( $+functions[_deno__help__task_commands] )) ||
_deno__help__task_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
    )
    _describe -t commands 'deno help task commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri_commands] )) ||
_deno__help__task__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
    )
    _describe -t commands 'deno help task tauri commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__add_commands] )) ||
_deno__help__task__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri add commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__android_commands] )) ||
_deno__help__task__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'deno help task tauri android commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__android__android-studio-script_commands] )) ||
_deno__help__task__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__android__build_commands] )) ||
_deno__help__task__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri android build commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__android__dev_commands] )) ||
_deno__help__task__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri android dev commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__android__init_commands] )) ||
_deno__help__task__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri android init commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__build_commands] )) ||
_deno__help__task__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri build commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__bundle_commands] )) ||
_deno__help__task__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri bundle commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__capability_commands] )) ||
_deno__help__task__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'deno help task tauri capability commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__capability__new_commands] )) ||
_deno__help__task__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri capability new commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__completions_commands] )) ||
_deno__help__task__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri completions commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__dev_commands] )) ||
_deno__help__task__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri dev commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__icon_commands] )) ||
_deno__help__task__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri icon commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__info_commands] )) ||
_deno__help__task__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri info commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__init_commands] )) ||
_deno__help__task__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri init commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__inspect_commands] )) ||
_deno__help__task__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'deno help task tauri inspect commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__inspect__wix-upgrade-code_commands] )) ||
_deno__help__task__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__migrate_commands] )) ||
_deno__help__task__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri migrate commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__permission_commands] )) ||
_deno__help__task__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'deno help task tauri permission commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__permission__add_commands] )) ||
_deno__help__task__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri permission add commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__permission__ls_commands] )) ||
_deno__help__task__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri permission ls commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__permission__new_commands] )) ||
_deno__help__task__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri permission new commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__permission__rm_commands] )) ||
_deno__help__task__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri permission rm commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__plugin_commands] )) ||
_deno__help__task__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'deno help task tauri plugin commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__plugin__android_commands] )) ||
_deno__help__task__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'deno help task tauri plugin android commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__plugin__android__init_commands] )) ||
_deno__help__task__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri plugin android init commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__plugin__init_commands] )) ||
_deno__help__task__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri plugin init commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__plugin__ios_commands] )) ||
_deno__help__task__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'deno help task tauri plugin ios commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__plugin__ios__init_commands] )) ||
_deno__help__task__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri plugin ios init commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__plugin__new_commands] )) ||
_deno__help__task__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri plugin new commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__signer_commands] )) ||
_deno__help__task__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'deno help task tauri signer commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__signer__generate_commands] )) ||
_deno__help__task__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri signer generate commands' commands "$@"
}
(( $+functions[_deno__help__task__tauri__signer__sign_commands] )) ||
_deno__help__task__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'deno help task tauri signer sign commands' commands "$@"
}
(( $+functions[_deno__task_commands] )) ||
_deno__task_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'deno task commands' commands "$@"
}
(( $+functions[_deno__task__help_commands] )) ||
_deno__task__help_commands() {
    local commands; commands=(
'tauri:Command line interface for building Tauri apps' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'deno task help commands' commands "$@"
}
(( $+functions[_deno__task__help__help_commands] )) ||
_deno__task__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help help commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri_commands] )) ||
_deno__task__help__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
    )
    _describe -t commands 'deno task help tauri commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__add_commands] )) ||
_deno__task__help__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri add commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__android_commands] )) ||
_deno__task__help__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'deno task help tauri android commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__android__android-studio-script_commands] )) ||
_deno__task__help__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__android__build_commands] )) ||
_deno__task__help__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri android build commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__android__dev_commands] )) ||
_deno__task__help__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri android dev commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__android__init_commands] )) ||
_deno__task__help__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri android init commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__build_commands] )) ||
_deno__task__help__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri build commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__bundle_commands] )) ||
_deno__task__help__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri bundle commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__capability_commands] )) ||
_deno__task__help__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'deno task help tauri capability commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__capability__new_commands] )) ||
_deno__task__help__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri capability new commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__completions_commands] )) ||
_deno__task__help__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri completions commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__dev_commands] )) ||
_deno__task__help__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri dev commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__icon_commands] )) ||
_deno__task__help__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri icon commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__info_commands] )) ||
_deno__task__help__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri info commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__init_commands] )) ||
_deno__task__help__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri init commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__inspect_commands] )) ||
_deno__task__help__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'deno task help tauri inspect commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__inspect__wix-upgrade-code_commands] )) ||
_deno__task__help__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__migrate_commands] )) ||
_deno__task__help__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri migrate commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__permission_commands] )) ||
_deno__task__help__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'deno task help tauri permission commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__permission__add_commands] )) ||
_deno__task__help__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri permission add commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__permission__ls_commands] )) ||
_deno__task__help__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri permission ls commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__permission__new_commands] )) ||
_deno__task__help__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri permission new commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__permission__rm_commands] )) ||
_deno__task__help__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri permission rm commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__plugin_commands] )) ||
_deno__task__help__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'deno task help tauri plugin commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__plugin__android_commands] )) ||
_deno__task__help__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'deno task help tauri plugin android commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__plugin__android__init_commands] )) ||
_deno__task__help__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri plugin android init commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__plugin__init_commands] )) ||
_deno__task__help__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri plugin init commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__plugin__ios_commands] )) ||
_deno__task__help__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'deno task help tauri plugin ios commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__plugin__ios__init_commands] )) ||
_deno__task__help__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri plugin ios init commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__plugin__new_commands] )) ||
_deno__task__help__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri plugin new commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__signer_commands] )) ||
_deno__task__help__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'deno task help tauri signer commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__signer__generate_commands] )) ||
_deno__task__help__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri signer generate commands' commands "$@"
}
(( $+functions[_deno__task__help__tauri__signer__sign_commands] )) ||
_deno__task__help__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'deno task help tauri signer sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri_commands] )) ||
_npm__run__tauri_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri commands' commands "$@"
}
(( $+functions[_npm__run__tauri__add_commands] )) ||
_npm__run__tauri__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android_commands] )) ||
_npm__run__tauri__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__android-studio-script_commands] )) ||
_npm__run__tauri__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__build_commands] )) ||
_npm__run__tauri__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__dev_commands] )) ||
_npm__run__tauri__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help_commands] )) ||
_npm__run__tauri__android__help_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri android help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__android-studio-script_commands] )) ||
_npm__run__tauri__android__help__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__build_commands] )) ||
_npm__run__tauri__android__help__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__dev_commands] )) ||
_npm__run__tauri__android__help__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__help_commands] )) ||
_npm__run__tauri__android__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__help__init_commands] )) ||
_npm__run__tauri__android__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__android__init_commands] )) ||
_npm__run__tauri__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__build_commands] )) ||
_npm__run__tauri__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__bundle_commands] )) ||
_npm__run__tauri__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri bundle commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability_commands] )) ||
_npm__run__tauri__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri capability commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help_commands] )) ||
_npm__run__tauri__capability__help_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri capability help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help__help_commands] )) ||
_npm__run__tauri__capability__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__help__new_commands] )) ||
_npm__run__tauri__capability__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__capability__new_commands] )) ||
_npm__run__tauri__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri capability new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__completions_commands] )) ||
_npm__run__tauri__completions_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri completions commands' commands "$@"
}
(( $+functions[_npm__run__tauri__dev_commands] )) ||
_npm__run__tauri__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help_commands] )) ||
_npm__run__tauri__help_commands() {
    local commands; commands=(
'init:Initialize a Tauri project in an existing directory' \
'dev:Run your app in development mode' \
'build:Build your app in release mode and generate bundles and installers' \
'bundle:Generate bundles and installers for your app (already built by \`tauri build\`)' \
'android:Android commands' \
'migrate:Migrate from v1 to v2' \
'info:Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations' \
'add:Add a tauri plugin to the project' \
'plugin:Manage or create Tauri plugins' \
'icon:Generate various icons for all major platforms' \
'signer:Generate signing keys for Tauri updater or sign files' \
'completions:Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish' \
'permission:Manage or create permissions for your app or plugin' \
'capability:Manage or create capabilities for your app' \
'inspect:Manage or create permissions for your app or plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__add_commands] )) ||
_npm__run__tauri__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android_commands] )) ||
_npm__run__tauri__help__android_commands() {
    local commands; commands=(
'init:Initialize Android target in the project' \
'dev:Run your app in development mode on Android' \
'build:Build your app in release mode for Android and generate APKs and AABs' \
'android-studio-script:' \
    )
    _describe -t commands 'npm run tauri help android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__android-studio-script_commands] )) ||
_npm__run__tauri__help__android__android-studio-script_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android android-studio-script commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__build_commands] )) ||
_npm__run__tauri__help__android__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__dev_commands] )) ||
_npm__run__tauri__help__android__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__android__init_commands] )) ||
_npm__run__tauri__help__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__build_commands] )) ||
_npm__run__tauri__help__build_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help build commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__bundle_commands] )) ||
_npm__run__tauri__help__bundle_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help bundle commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__capability_commands] )) ||
_npm__run__tauri__help__capability_commands() {
    local commands; commands=(
'new:Create a new permission file' \
    )
    _describe -t commands 'npm run tauri help capability commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__capability__new_commands] )) ||
_npm__run__tauri__help__capability__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help capability new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__completions_commands] )) ||
_npm__run__tauri__help__completions_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help completions commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__dev_commands] )) ||
_npm__run__tauri__help__dev_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help dev commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__help_commands] )) ||
_npm__run__tauri__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__icon_commands] )) ||
_npm__run__tauri__help__icon_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help icon commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__info_commands] )) ||
_npm__run__tauri__help__info_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help info commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__init_commands] )) ||
_npm__run__tauri__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__inspect_commands] )) ||
_npm__run__tauri__help__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
    )
    _describe -t commands 'npm run tauri help inspect commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__inspect__wix-upgrade-code_commands] )) ||
_npm__run__tauri__help__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__migrate_commands] )) ||
_npm__run__tauri__help__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help migrate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission_commands] )) ||
_npm__run__tauri__help__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
    )
    _describe -t commands 'npm run tauri help permission commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__add_commands] )) ||
_npm__run__tauri__help__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__ls_commands] )) ||
_npm__run__tauri__help__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__new_commands] )) ||
_npm__run__tauri__help__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__permission__rm_commands] )) ||
_npm__run__tauri__help__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help permission rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin_commands] )) ||
_npm__run__tauri__help__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__android_commands] )) ||
_npm__run__tauri__help__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__android__init_commands] )) ||
_npm__run__tauri__help__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__init_commands] )) ||
_npm__run__tauri__help__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__ios_commands] )) ||
_npm__run__tauri__help__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri help plugin ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__ios__init_commands] )) ||
_npm__run__tauri__help__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__plugin__new_commands] )) ||
_npm__run__tauri__help__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help plugin new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer_commands] )) ||
_npm__run__tauri__help__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
    )
    _describe -t commands 'npm run tauri help signer commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer__generate_commands] )) ||
_npm__run__tauri__help__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help signer generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__help__signer__sign_commands] )) ||
_npm__run__tauri__help__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri help signer sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri__icon_commands] )) ||
_npm__run__tauri__icon_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri icon commands' commands "$@"
}
(( $+functions[_npm__run__tauri__info_commands] )) ||
_npm__run__tauri__info_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri info commands' commands "$@"
}
(( $+functions[_npm__run__tauri__init_commands] )) ||
_npm__run__tauri__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect_commands] )) ||
_npm__run__tauri__inspect_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri inspect commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help_commands] )) ||
_npm__run__tauri__inspect__help_commands() {
    local commands; commands=(
'wix-upgrade-code:Print the default Upgrade Code used by MSI installer derived from productName' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri inspect help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help__help_commands] )) ||
_npm__run__tauri__inspect__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__help__wix-upgrade-code_commands] )) ||
_npm__run__tauri__inspect__help__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect help wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__inspect__wix-upgrade-code_commands] )) ||
_npm__run__tauri__inspect__wix-upgrade-code_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri inspect wix-upgrade-code commands' commands "$@"
}
(( $+functions[_npm__run__tauri__migrate_commands] )) ||
_npm__run__tauri__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri migrate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission_commands] )) ||
_npm__run__tauri__permission_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri permission commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__add_commands] )) ||
_npm__run__tauri__permission__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help_commands] )) ||
_npm__run__tauri__permission__help_commands() {
    local commands; commands=(
'new:Create a new permission file' \
'add:Add a permission to capabilities' \
'rm:Remove a permission file, and its reference from any capability' \
'ls:List permissions available to your application' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri permission help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__add_commands] )) ||
_npm__run__tauri__permission__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help add commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__help_commands] )) ||
_npm__run__tauri__permission__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__ls_commands] )) ||
_npm__run__tauri__permission__help__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__new_commands] )) ||
_npm__run__tauri__permission__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__help__rm_commands] )) ||
_npm__run__tauri__permission__help__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission help rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__ls_commands] )) ||
_npm__run__tauri__permission__ls_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission ls commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__new_commands] )) ||
_npm__run__tauri__permission__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__permission__rm_commands] )) ||
_npm__run__tauri__permission__rm_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri permission rm commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin_commands] )) ||
_npm__run__tauri__plugin_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android_commands] )) ||
_npm__run__tauri__plugin__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help_commands] )) ||
_npm__run__tauri__plugin__android__help_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin android help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help__help_commands] )) ||
_npm__run__tauri__plugin__android__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__help__init_commands] )) ||
_npm__run__tauri__plugin__android__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__android__init_commands] )) ||
_npm__run__tauri__plugin__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help_commands] )) ||
_npm__run__tauri__plugin__help_commands() {
    local commands; commands=(
'new:Initializes a new Tauri plugin project' \
'init:Initialize a Tauri plugin project on an existing directory' \
'android:Manage the Android project for a Tauri plugin' \
'ios:Manage the iOS project for a Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__android_commands] )) ||
_npm__run__tauri__plugin__help__android_commands() {
    local commands; commands=(
'init:Initializes the Android project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri plugin help android commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__android__init_commands] )) ||
_npm__run__tauri__plugin__help__android__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help android init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__help_commands] )) ||
_npm__run__tauri__plugin__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__init_commands] )) ||
_npm__run__tauri__plugin__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__ios_commands] )) ||
_npm__run__tauri__plugin__help__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
    )
    _describe -t commands 'npm run tauri plugin help ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__ios__init_commands] )) ||
_npm__run__tauri__plugin__help__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__help__new_commands] )) ||
_npm__run__tauri__plugin__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin help new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__init_commands] )) ||
_npm__run__tauri__plugin__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios_commands] )) ||
_npm__run__tauri__plugin__ios_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin ios commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help_commands] )) ||
_npm__run__tauri__plugin__ios__help_commands() {
    local commands; commands=(
'init:Initializes the iOS project for an existing Tauri plugin' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri plugin ios help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help__help_commands] )) ||
_npm__run__tauri__plugin__ios__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__help__init_commands] )) ||
_npm__run__tauri__plugin__ios__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios help init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__ios__init_commands] )) ||
_npm__run__tauri__plugin__ios__init_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin ios init commands' commands "$@"
}
(( $+functions[_npm__run__tauri__plugin__new_commands] )) ||
_npm__run__tauri__plugin__new_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri plugin new commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer_commands] )) ||
_npm__run__tauri__signer_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri signer commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__generate_commands] )) ||
_npm__run__tauri__signer__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help_commands] )) ||
_npm__run__tauri__signer__help_commands() {
    local commands; commands=(
'sign:Sign a file' \
'generate:Generate a new signing key to sign files' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'npm run tauri signer help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__generate_commands] )) ||
_npm__run__tauri__signer__help__generate_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help generate commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__help_commands] )) ||
_npm__run__tauri__signer__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help help commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__help__sign_commands] )) ||
_npm__run__tauri__signer__help__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer help sign commands' commands "$@"
}
(( $+functions[_npm__run__tauri__signer__sign_commands] )) ||
_npm__run__tauri__signer__sign_commands() {
    local commands; commands=()
    _describe -t commands 'npm run tauri signer sign commands' commands "$@"
}

if [ "$funcstack[1]" = "_deno" ]; then
    _deno "$@"
else
    compdef _deno deno
fi

