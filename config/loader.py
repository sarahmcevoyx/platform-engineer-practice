from config.loader import load_tf_config, run_terraform_validate
from utils.errors import setup_logging

logger = setup_logging()

tf_file_path = "modules/platform_app/main.tf"  # Path to your actual Terraform file

try:
    # Option 1: Load the .tf file as plain text
    tf_config = load_tf_config(tf_file_path)
    logger.info("Terraform File Loaded Successfully: %s", tf_config)
    
    # Option 2: Validate the .tf file using terraform validate
    run_terraform_validate("config")
    logger.info("Terraform validation passed.")
    
    print("Test Passed: Terraform File Loaded and Validated Successfully!")
except Exception as e:
    logger.critical("Error: %s", e)
    print("Test Failed:", e)