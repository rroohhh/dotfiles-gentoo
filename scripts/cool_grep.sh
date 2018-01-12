locate main.js | parallel \'echo {} && fgrep -i size {}\'   | grep -C 2 size
