import argparse
import webbrowser

def open_link(url, use_http):
    # Определяем протокол
    protocol = "http" if use_http else "https"
    
    # Если URL уже содержит протокол, убираем его
    if url.startswith("http://") or url.startswith("https://"):
        full_url = url
    else:
        full_url = f"{protocol}://{url}"
    
    # Открываем ссылку
    webbrowser.open(full_url)

def main():
    # Создание парсера аргументов
    parser = argparse.ArgumentParser(
        description="Utility to open URLs with https by default, or http with the -u flag."
    )
    
    # Добавление флага для использования http
    parser.add_argument(
        '-u', 
        '--use-http', 
        action='store_true', 
        help='Use http instead of https'
    )
    
    # Добавление аргумента для URL
    parser.add_argument(
        'url', 
        help='URL to open (without protocol)'
    )
    
    # Разбор аргументов
    args = parser.parse_args()
    
    # Открываем ссылку
    open_link(args.url, args.use_http)

if __name__ == "__main__":
    main()

