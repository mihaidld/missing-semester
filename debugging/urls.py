#!/usr/bin/env python


import requests
from bs4 import BeautifulSoup
from line_profiler import profile #use Python line profiler to check CPU time per program line


# This is a decorator that tells line_profiler
# that we want to analyze this function
# then set env variable and run script as usual with LINE_PROFILE=1 python urls.py
@profile
def get_urls():
    response = requests.get('https://missing.csail.mit.edu')
    s = BeautifulSoup(response.content, 'lxml')
    urls = []
    for url in s.find_all('a'):
        urls.append(url['href'])

if __name__ == '__main__':
    get_urls()
