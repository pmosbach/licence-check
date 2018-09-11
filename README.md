# license-check

Dockerfile to be used with tools that generate a report of the licenses used in a project's dependencies

## About project-check

The script uses [License Finder](https://jestjs.io/) as a test framework and
[jest-html-reporter](https://github.com/Hargne/jest-html-reporter) as a test reporter to run
basic quality checks against a project and produce a report that can be used along with other
tests, metrics, and analysis to assess project maturity.

## Install

`$ docker pull pmosbach/license-check`

## Usage

### Basic configuration with GitLab CI

The following is an example job from a `.gitlab-ci.yml` file to use this image to run the Project
Check script against your project:

```yml
project_check:
  stage: code_analysis
  image:
    name: pmosbach/license-check:latest
    entrypoint: [""]
  script:
    - license_finder report
    - license_finder project_name add $CI_PROJECT_NAME
    - license_finder report -p --format html --save="$CI_PROJECT_DIR/license-finder-report.html"
  allow_failure: true
  artifacts:
    when: always
    paths:
      - "license-finder-report.html"
```

### Report

The test runner will output the test results to the command line and you can see the results in the
job log of your CI job, but it will also produce an HTML report that can be captured as an artifact
(this is both recommended and included in the example job above). Here is an example of the
HTML report:

![sample HTML report](docs/report_example.PNG)

You can use environment variables to include your project's name in the test report (as shown in
the picture and example CI job), use a different theme for the report, or even to include a logo.
See [here](https://github.com/Hargne/jest-html-reporter/wiki/configuration) for available
configuration options.
