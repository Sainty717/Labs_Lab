#!/bin/bash
set -x

JL_CONFIG=/root/.jupyter/jupyter_notebook_config.py

# Check if config file exists
if [ ! -f "${JL_CONFIG}" ]; then
    echo "Config file ${JL_CONFIG} does not exist!"
    exit 1
fi

# Check permissions
if [ ! -w "${JL_CONFIG}" ]; then
    echo "Insufficient permissions to write to ${JL_CONFIG}!"
    exit 1
fi

# Append configurations
echo "c.NotebookApp.notebook_dir = '/root/'" >> "${JL_CONFIG}"
echo "c.NotebookApp.terminado_settings = {'shell_command': ['/bin/bash']}" >> "${JL_CONFIG}"

# Check if configurations are added
if grep -q "c.NotebookApp.notebook_dir = '/root/'" "${JL_CONFIG}"; then
    echo "Notebook directory set successfully!"
else
    echo "Failed to set notebook directory!"
fi

if grep -q "c.NotebookApp.terminado_settings = {'shell_command': ['/bin/bash']}" "${JL_CONFIG}"; then
    echo "Terminal settings updated successfully!"
else
    echo "Failed to update terminal settings!"
fi

# Start JupyterLab
jupyter lab --ip=0.0.0.0 --port="${JL_PORT}" --no-browser \
  --notebook-dir="${JL_DATA}" --allow-root \
  --NotebookApp.token="${JL_PASSWD}"
