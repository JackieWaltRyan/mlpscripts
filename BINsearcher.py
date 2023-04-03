from os import listdir, makedirs
from os.path import exists, isfile
from re import findall
from sys import exit


def find_bin_files(keywords):
    try:
        if exists(path="bin"):
            files = [x for x in listdir(path="bin") if isfile(path=f"bin/{x}") and f"bin/{x}".endswith(".bin")]
            data, i, response = {}, 1, True
            if len(files) > 0:
                for file in files:
                    print(f"[{i} из {len(files)}] Ищем данные в: bin/{file}")
                    try:
                        with open(file=f"bin/{file}",
                                  mode="rb") as input_bin_file:
                            for line in input_bin_file.readlines():
                                for keyword in keywords:
                                    if keyword not in data:
                                        data.update({keyword: []})
                                    for word in findall(pattern=rb"(%s_\w+)" % keyword.encode(encoding="UTF-8",
                                                                                              errors="ignore"),
                                                        string=line):
                                        if word.decode(encoding="UTF-8",
                                                       errors="ignore") not in data[keyword]:
                                            data[keyword].append(word.decode(encoding="UTF-8",
                                                                             errors="ignore"))
                    except Exception:
                        print(f"При обработке файла bin/{file} возникла ошибка. "
                              f"Возможно данные в файле повреждены или нет прав на чтение файлов. "
                              f"Файл пропущен.")
                        response = False if response else False
                    i += 1
                if not exists(path="TXT"):
                    print(f"2: Создание папки TXT.")
                    try:
                        makedirs(name="TXT")
                    except Exception:
                        print(f"Во время создания папки TXT возникла ошибка. "
                              f"Возможно нет прав на создания папок.")
                        response = False
                for key in data:
                    print(f"3: Создание файла TXT/{key}.txt.")
                    try:
                        with open(file=f"TXT/{key}.txt",
                                  mode="w",
                                  encoding="UTF-8") as output_txt_file:
                            for item in data[key]:
                                output_txt_file.write(f"{item}\n")
                    except Exception:
                        print(f"Во время создания файла TXT/{key}.txt возникла ошибка. "
                              f"Возможно нет прав на создания файлов."
                              f"Файл пропущен.")
                        response = False
                return response
            else:
                print("В папке bin нет файлов. "
                      "Загрузите в нее бинарные файлы в которых нужно найти данные.")
                return False
        else:
            print(f"Папки bin не существует. "
                  f"Будет создана пустая папка. "
                  f"Загрузите в нее бинарные файлы в которых нужно найти данные.")
            try:
                makedirs(name="bin")
            except Exception:
                print(f"Во время создания папки bin возникла ошибка. "
                      f"Возможно нет прав на создания папок.")
            return False
    except Exception:
        print("Во время обработки файлов в папке bin возникла ошибка. "
              "Возможно файлы в папке повреждены или нет прав на чтение файлов.")
        return False


def load_file_settings():
    try:
        if exists(path="BINsearcher.txt"):
            print("1: Обработка файла BINsearcher.txt.")
            with open(file="BINsearcher.txt",
                      mode="r",
                      encoding="UTF-8") as input_file_txt:
                keywords = [x.strip() for x in input_file_txt.readlines() if x.strip() != ""]
                if len(keywords) > 0:
                    return find_bin_files(keywords=keywords)
                else:
                    print("В файле BINsearcher.txt нет ключевых слов. "
                          "Добавьте ключевые слова в этот файл. "
                          "На одной строке одно слово. "
                          "Для работы программы нужно добавить хотя бы один.")
                    return False
        else:
            print("Файл настроек BINsearcher.txt не обнаружен. "
                  "Будет создан новый пустой файл. "
                  "Добавьте в него ключевые слова. "
                  "На одной строке одно слово. "
                  "Для работы программы нужно добавить хотя бы один.")
            try:
                with open(file="BINsearcher.txt",
                          mode="w",
                          encoding="UTF-8") as input_file_txt:
                    input_file_txt.close()
            except Exception:
                print("Во время создания файла BINsearcher.txt возникла ошибка. "
                      "Возможно нет прав на создания файлов.")
            return False
    except Exception:
        print("Во время обработки файла настроек BINsearcher.txt возникла ошибка. "
              "Возможно данные в файле повреждены или нет прав на чтение файлов.")
        return False


if __name__ == "__main__":
    try:
        if load_file_settings():
            exit()
        else:
            raise Exception
    except Exception:
        input()
        exit()
