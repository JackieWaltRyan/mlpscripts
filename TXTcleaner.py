from os import getcwd, walk, remove
from os.path import join

if __name__ == "__main__":
    path = getcwd()
    for root, dirs, files in walk(top=path):
        for file in files:
            if file.endswith(".txt") and not file.startswith("english") and not file.endswith("russian"):
                filename = join(root, file)
                print(f"Удаляем: {filename}")
                remove(path=filename)
