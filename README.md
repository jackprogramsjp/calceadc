# calceadc
Calcead Compiler - Compiles to an executable

**Note:** Only works for `aarch64-apple-darwin`.

`calceadc` compiles all the way down to an executable. `calcead` only compiles to LLVM IR code, so `calceadc` compiles that LLVM IR code to assembly, and to an executable, and handles it for you!
`calceadc` also contains flags to help you easily compile your `calcead` files!

To install, run this:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jackprogramsjp/calceadc/main/install.sh)"
```

To uninstall, run this:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jackprogramsjp/calceadc/main/uninstall.sh)"
```

## Info

Flags:
* `-h` or `--help`: Shows the flags and commands
* `-o <output>`: Names the executable as the `<output>`
* `--verbose`: Show what commands are being done when generating the executable

Examples:
`calceadc -o main main.cld`: This will generate an executable named `main` generated from the `main.cld` file.

**Note:** Flags must be put before the file is put.