# Hello world docker action

This action conducts AGREE analysis on a the named component.

## Inputs

## `component-to-analyze`

**Required** The name of the AADL component to analyze. Default `"Top.impl"`.

## Outputs

## `result`

The JSON-formatted summary of analysis results.

## Example usage

uses: actions/AGREE-CI-Action@v1
with:
  component-to-analyze: 'Octocat.impl'
