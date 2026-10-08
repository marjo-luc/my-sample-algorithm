# Jupyter notebook entrypoint, executed via papermill.
# COPY paths are relative to the REPO ROOT -- the Action builds with context: .
FROM ghcr.io/osgeo/gdal:ubuntu-small-latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends python3-pip \
    && rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --break-system-packages -r /app/requirements.txt \
    && python3 -m ipykernel install --name python3

# Notebook and its entrypoint wrapper
COPY ./demo_color_to_greyscale.ipynb /app/demo_color_to_greyscale.ipynb
COPY ./run.py /usr/local/bin/run.py

RUN chmod +x /usr/local/bin/run.py

# run_command: run.py
