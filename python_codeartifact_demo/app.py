
import logging
logger = logging.getLogger("python_codeartifact_demo")


class App:
    def __init__(self, settings):
        self.settings = settings

    def start(self):
        logger.info("python_codeartifact_demo Starting")

    def stop(self):
        logger.info("python_codeartifact_demo Stopping")
