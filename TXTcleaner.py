from os import getcwd, walk, remove
from os.path import join

if __name__ == "__main__":
    for root, dirs, files in walk(top=getcwd()):
        for file in files:
            if file.endswith not in ["english.txt", "russian.txt", ".exe", ".py"]:
                print(f"Удаляем: {join(root, file)}")
                remove(path=join(root, file))
    input()
    exit()
