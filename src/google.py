import argparse
import os
import urllib.parse
import webbrowser

def search_google(query):
    # Properly encode the query for URL
    search_url = "https://www.google.com/search?q=" + urllib.parse.quote_plus(' '.join(query))
    webbrowser.open(search_url)    

def main():
    # Create an argument parser
    parser = argparse.ArgumentParser(
        description="Utility to search Google with a provided query (supports Russian language)."
    )
    
    # Add arguments
    parser.add_argument(
        'query', 
        nargs='+', 
        help='The search query for Google'
    )
    
    # Parse arguments
    args = parser.parse_args()
    
    # Perform Google search
    search_google(args.query)

if __name__ == "__main__":
    main()

