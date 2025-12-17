from setuptools import setup

setup(
    name='HukukTakip',
    version='0.1',
    packages=[],
    install_requires=[
        'kivy>=2.2.1',
    ],
    entry_points={
        'console_scripts': [
            'hukuktakip=main:main',
        ],
    },
)
