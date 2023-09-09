#!/usr/bin/python

import os
import argparse
import collections
from typing import List
import requests


def main(argv: List[str] = None) -> int:
    """ Main function """
    parser = build_parser()
    args = parser.parse_args(argv)

    url = ''

    if args.URL:
        url = args.URL

    if ('http://' or 'https://' or 'http://www.' or 'https://www.') not in url:
        if url[:4] == 'www.':
            url = url[4:]
        url = 'http://' + url

    try:
        resp = requests.get(url)
    except requests.exceptions.RequestException:
        os.sys.stderr.write(f'Response Failed.')
        return 1

    header = dict(collections.OrderedDict(resp.headers))
    body = resp.text

    if args.body and not args.header:
        print(body)
        return 0

    if args.header and not args.body:
        for section in sorted(header.items()):
            print(f"\033[92m{section[0]}:\033[93m {section[1]}\033[0m")

        return 0

    if (args.header and args.body) or (not args.header and not args.body):
        for section in sorted(header.items()):
            print(f"\033[92m{section[0]}:\033[93m {section[1]}\033[0m")

        print()
        print(body)
        return 0

    return 1


def build_parser():
    parser = argparse.ArgumentParser(
        prog='tihttp',
        description=f'A tiny HTTP client for sending GET requests.'
    )

    # positional arguments:
    parser.add_argument(
    'URL',
    action='store',
    )

    # optional arguments:
    parser.add_argument(
    '-H',
    '--header-only',
    dest='header',
    action='store_true',
    help='Prints only the header of the Response.')

    parser.add_argument(
    '-B',
    '--body-only',
    dest='body',
    action='store_true',
    help='Prints only the body of the Response.')
    return parser


def run_main():
    try:
        os.sys.exit(main())
    except KeyboardInterrupt:
        os.sys.stderr.write("\033[91mCanceled by user.\033[0m")
        os.sys.exit(125)
    except Exception as e:
        os.sys.stderr.write(e)
        os.sys.exit(1)


if __name__ == '__main__':
    run_main()
