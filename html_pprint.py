import glob

from bs4 import BeautifulSoup


def _main():
    files = [x for x in glob.glob("./site/**", recursive=True) if x.endswith(".html")]
    
    for file in files:
        content = ""

        with open(file, mode="r+") as f:
            soup = BeautifulSoup(f.read(), 'html.parser')
            
            content = soup.prettify()

            f.seek(0)
            f.truncate(0)

            f.write(content)
        

if __name__ == "__main__":
    _main()
    print("hi")
