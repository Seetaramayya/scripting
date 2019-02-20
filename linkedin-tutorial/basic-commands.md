# Basic Commands

By the time I learning this material I do not know following commands.

### Brace expansion

  `{` will be expanded.

  Example

  - `touch {seeta,ramayya,vadali}`
  - `touch file_{1..10}`
  - `touch file_{01..10}` this `0` padding creates sorted order
  - `echo {1..10}`
  - `echo {1..10..2}`
  - `echo {10..1..2}`
  - `echo {A..Z}`
  - `echo {A..z}`
  - `echo {A..Z..2}` => TODO check this
  - `touch {seeta,ramayya,vadali}_{01..10}{a..d}`

### Redirection

  - `1>` is standard out redirection.
  - `2>` is standard error redirection.
  - `&>` is for both
  - `/dev/null` redirection when we do not care output

### Grep, AWK, SED & Cut

  - TODO: Learn more about these commands. Especially `AWK`, `SED` and `cut`

  - `grep -i break-in ExerciseFiles/auth.log | awk {'print $12'}`

  - ` ping -c 1 example.com | grep "bytes from" | cut -d = -f 4`

    - `-d` is delimiter
    - `-f` is field