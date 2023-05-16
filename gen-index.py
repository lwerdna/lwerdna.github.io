#!/usr/bin/env python

import os, sys, re, pprint

def get_files_named(name):
    return sum([[os.path.join(r, f) for f in
        [f for f in fs if f==name]]
        for (r,d,fs) in os.walk('.')], [])

if __name__ == '__main__':
    fpaths = get_files_named('index.html')

    print('''
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>lwerdna.github.io</title>
  </head>
  <body>
''')

    for fpath in sorted(fpaths):
        if fpath == './index.html': continue
        title = re.match(r'^\.\/(.*)\/index.html', fpath).group(1)
        print(f'<a href="{fpath}">{title}</a>')
        print('<br>')

    print('''
  </body>
  <script src="myscript1.js"></script> <!-- loads after body -->
</html>
''')
