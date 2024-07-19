# Makefile for Flutter project automation

.PHONY: clean get run

clean:
	flutter clean

get:
	flutter pub get

run:
	flutter run

all: clean get run
