# Common Setup

* Create docker instance with the following command:
  ```
  sudo docker run --gpus all -it --rm --ipc=host \
  -v $HOME/.cache/huggingface:/root/.cache/huggingface \
  -v ${PWD}:/workspace -w /workspace \
  nvcr.io/nvidia/pytorch:25.09-py3
  ```
* Run the following script to setup docker instance. It:
  * installs basic ubuntu utilities
  * sets up common config files
  * installs basic python packages
  ```
  ./setup.sh
  ```
