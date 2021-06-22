`rebar3` custom templates for OTP releases.

### Usage
```
$ rebar3 new project <appname>
```

This creates a new directory `<appname>` with the following directory structure
```
.
├── config
│   ├── dev.vars
│   ├── local.vars
│   ├── prod.vars
│   ├── sys.config
│   ├── test.vars
│   └── vm.args
├── LICENSE
├── Makefile
├── README.md
├── rebar.config
├── apps
│   ├── <appname>.app.src
│   └── <appname>.erl
└── test
    ├── regression
    │   └── <appname>_test_SUITE.erl
    └── stubs

```

### NOTE
- Be sure to change the value for `erlang_cookie` in `config/prod.vars`.
