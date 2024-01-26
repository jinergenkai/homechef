# Home Chef
 - Platform that connects users to hire chefs to cook at home
## Getting Started

### Requirements
- Dart: 3.1.0
- Flutter SDK: 3.13.1
- Melos: 3.1.0
- CocoaPods: 1.12.0 (optional)
### Install
- WARN: If you already installed `melos` and `lefthook`, you could omit this step.

- Install melos:
    - Run `dart pub global activate melos 3.1.0`

- Install lefthook (optional):
    - Run `gem install lefthook`

- Export paths (auto):
    - Add to `.zshrc` or `.bashrc` file
```    
export PATH="$PATH:<path to flutter>/flutter/bin"
export PATH="$PATH:<path to flutter>/flutter/bin/cache/dart-sdk/bin"
export PATH="$PATH:~/.pub-cache/bin"
export PATH="$PATH:~/.gem/gems/lefthook-0.7.7/bin"
```
    - Save file `.zshrc`
    - Run `source ~/.zshrc`

### Config and run app

- cd to root folder of project
- Run `make gen_env`
- Run `make sync`
- Run `lefthook install` (optional)
- Run `make run_dev` & Enjoy!

## Upgrade Flutter
- Update Flutter version in:
    - [README.md](#requirements)
    - [bitbucket-pipelines.yml](bitbucket-pipelines.yml)
    - [ci.yaml](.github/workflows/ci.yaml)
    - [cd_develop.yaml](.github/workflows/cd_develop.yaml)
    - [cd_qa.yaml](.github/workflows/cd_qa.yaml)
    - [cd_staging.yaml](.github/workflows/cd_staging.yaml)
    - [cd_production.yaml](.github/workflows/cd_production.yaml)

## Upgrade Melos
- Update Melos version in:
    - [README.md](#requirements)
    - [Install](#install)
    - [bitbucket-pipelines.yml](bitbucket-pipelines.yml)
    - [ci.yaml](.github/workflows/ci.yaml)
    - [cd_develop.yaml](.github/workflows/cd_develop.yaml)
    - [cd_qa.yaml](.github/workflows/cd_qa.yaml)
    - [cd_staging.yaml](.github/workflows/cd_staging.yaml)
    - [cd_production.yaml](.github/workflows/cd_production.yaml)

## Note for update base project.
    - fix dependency override from [dart_style](https://github.com/dart-lang/dart_style/issues/1328) - because of dart_style's new version not compatible.
    - disabled double quote.
    - add more app base color like Black Red, disabled ....
    - create tool generate color - style
    - lack of command: make build_resources.
    - add default theme (like Montserrat or somthingelse)
    - add mock api io client for test api
    - add snippet like Dimens, AppColor

## Step for everything
- Add new route
    1. add @RoutePage() above widget page.
    2. `make build_app`
    3. 

## License
- MIT

<!-- - số người nấu. chi tiết hơn -->
<!-- món ăn: suggestion - other. list trước -->
<!-- option: bàn ghế (nấu giỗ) -->
<!-- chọn address ở choose cooking time -->

<!-- nấu tại địa điểm họ - hay nấu mang đén -->

flow 2 =))
chọn đầu bếp nấu ăn hàn quốc.
- tính tiền theo thực đơn.