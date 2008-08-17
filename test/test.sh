#!/bin/sh

source ../knock.sh

ok true
ok ! false

ok "(ok true | grep -q '^ok')"
ok "(ok false | grep -q '^not ok')"

# self-test
ok ok true
ok ! ok "false"

ok "(ok 'echo foo>/dev/stderr' 2>&1 | grep -q '# foo')  # stderr gets commented"