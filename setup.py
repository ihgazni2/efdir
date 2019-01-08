#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""The setup script."""

from setuptools import setup, find_packages

with open('./README.rst') as readme_file:
    readme = readme_file.read()


requirements = [
    'lxml',
    'elist',
    'xdict',
    'nvhtml',
    'docutils'
]

setup_requirements = [
    'lxml',
    'elist',
    'xdict',
    'nvhtml',
    'docutils'
]


setup(
    name='efdir',
    version='0.0.11',
    description="handle dirs, mktree from .rst or .json",
    long_description=readme,
    author="dli",
    author_email='286264978@qq.com',
    url='https://github.com/ihgazni2/efdir',
    packages=find_packages(),
    package_data={
                  'documentation': ['docs/*']
                 },
    include_package_data=True,
    install_requires=requirements,
    license="MIT license",
    keywords='mktree,dir-toolset',
     entry_points = {
         'console_scripts': ['efdir=efdir.bin:main']
    },
    classifiers=[
        'Environment :: Console',
        'Environment :: Web Environment',
        'Intended Audience :: End Users/Desktop',
        'Intended Audience :: Developers',
        'Intended Audience :: System Administrators',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: 3.4',
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
    ],
    setup_requires=setup_requirements,
    py_modules=['efdir'],
)