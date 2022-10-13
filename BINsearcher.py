from binascii import unhexlify
from os import listdir, makedirs
from os.path import exists, isfile, join
from re import findall
from typing import List


def error(message, file=None):
    if message == 1:
        print(f"Файл \"{file}\" отсутсвует или в нем нет ключевых слов. Добавьте ключевые слова в этот файл. На одной "
              f"строке одно слово!")
    if message == 2:
        print("Папки \"bin\" не существует или в ней нет файлов! Создайте папку \"bin\" и загрузите в нее бинарные "
              "файлы в которых нужно найти данные!")
    input()
    exit()


def load_keywords(file: str) -> List[str]:
    data_list: List[str] = []
    if exists(path=file):
        with open(file=file, mode="r", encoding="utf-8") as keywords:
            for line in keywords.readlines():
                if line.strip() != "":
                    data_list.append(line.strip())
        if len(data_list) == 0:
            error(message=1, file=file)
        else:
            return data_list
    else:
        with open(file="keywords.txt", mode="a+", encoding="utf-8") as keywords:
            keywords.close()
        error(message=1, file=file)


def get_decoded_data(file: str, found_data: List[str]) -> List[str]:
    found_data_list: List[str] = []
    with open(file=file, mode="rb") as opened_file:
        for raw_data in opened_file.readlines():
            decoded_data = unhexlify(raw_data.hex()).decode(encoding="ANSI")
            for keyword in found_data:
                for tag in findall(pattern=f"({keyword}_[a-zA-Z0-9_]+)", string=decoded_data):
                    found_data_list.append(tag)
    return found_data_list


def check_dir(path: str) -> bool:
    if exists(path=path):
        files: List[str] = [x for x in listdir(path=path) if isfile(path=join(path, x))]
        if len(files) == 0:
            return False
        else:
            return True
    else:
        makedirs(name="bin")
        return False


if __name__ == "__main__":
    keywords_list: List[str] = load_keywords(file="keywords.txt")
    if check_dir(path="bin"):
        for bin_file in listdir(path="bin"):
            print(f"Ищем данные в: {join('bin', bin_file)}")
            data: List[str] = get_decoded_data(file=join("bin", bin_file), found_data=keywords_list)
            with open(file="output_data.txt", mode="a+", encoding="utf-8") as output_file:
                for item in set(data):
                    output_file.write(f"{item}\n")
    else:
        error(message=2)
