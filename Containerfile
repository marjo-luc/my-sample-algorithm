# Python script entrypoint.
# COPY paths are relative to the REPO ROOT -- the Action builds with context: .
FROM python:3.12-slim

COPY ./write_inputs.py /usr/local/bin/write_inputs.py

RUN chmod +x /usr/local/bin/write_inputs.py

# No CMD/ENTRYPOINT: CWL supplies baseCommand plus the bound --flag value args.
# run_command: write_inputs.py
