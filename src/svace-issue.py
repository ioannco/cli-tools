import argparse
import webbrowser

# Constants
BASE_URL = "https://svacelab.intra.ispras.ru/svace/svace-dev/-/issues"
TASK_URL = "https://onlyoffice.intra.ispras.ru/products/files/doceditor.aspx?fileid=20633#"  # Replace with actual task URL

def main():
    # Set up argument parser
    parser = argparse.ArgumentParser(
        description="Open issue or task URLs."
    )
    parser.add_argument(
        "issue_id", 
        nargs="?", 
        default="", 
        help="The issue ID to open. If not provided, opens the base issues URL."
    )
    parser.add_argument(
        "-c", "--comment", 
        type=str, 
        help="Add a comment to the URL (e.g., #note_<comment_id>)."
    )
    parser.add_argument(
        "-t", "--task", 
        action="store_true", 
        help="Open the task URL."
    )

    # Parse the arguments
    args = parser.parse_args()

    # Determine which URL to open
    if args.task:
        url = TASK_URL
    elif args.issue_id:
        url = f"{BASE_URL}/{args.issue_id}"
        if args.comment:
            url += f"#note_{args.comment}"
    else:
        url = BASE_URL

    # Open the URL in the default browser
    webbrowser.open(url)

if __name__ == "__main__":
    main()

