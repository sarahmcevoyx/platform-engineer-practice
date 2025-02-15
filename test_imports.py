from config.loader import load_tf_config
from config.terraform_runner import run_terraform_validate
from utils.errors import setup_logging

logger = setup_logging()

# Path to your actual Terraform configuration file
tf_file_path = "modules/platform_app/main.tf"  # Update this path according to your project structure

def test_load_tf_config():
    """Test if the Terraform file loads correctly."""
    try:
        tf_config = load_tf_config(tf_file_path)
        logger.info("Terraform File Loaded Successfully.")
        print("Test Passed: Terraform File Loaded Successfully!")
        return tf_config  # Optionally return it for further inspection
    except Exception as e:
        logger.critical("Error loading Terraform file: %s", e)
        print("Test Failed: Error loading Terraform file:", e)

def test_terraform_validation():
    """Test if Terraform file passes the validation."""
    try:
        # Run `terraform validate` to check if the .tf files are valid
        run_terraform_validate("modules/platform_app")
        logger.info("Terraform Validation Passed.")
        print("Test Passed: Terraform Validation Successful!")
    except Exception as e:
        logger.critical("Terraform Validation Failed: %s", e)
        print("Test Failed: Terraform Validation Failed:", e)

if __name__ == "__main__":
    # Run both tests
    test_load_tf_config()
    test_terraform_validation()