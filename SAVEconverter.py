from os import listdir, makedirs
from os.path import exists, join, isfile
from re import findall, sub, MULTILINE

if __name__ == "__main__":
    if exists(path="bin"):
        files = [x for x in listdir(path="bin") if isfile(path=join("bin", x)) and join("bin", x).endswith(".bin")]
        i, ii = 1, 1
        if len(files) > 0:
            for file in files:
                try:
                    print(f"[{i} из {len(files)}] Ищем данные в: {join('bin', file)}")
                    data = b""
                    with open(file=join("bin", file),
                              mode="rb") as bin_file:
                        trigger = False
                        for line in bin_file.readlines():
                            if findall(pattern=b"<MLP_Save",
                                       string=line):
                                trigger = True
                            if trigger:
                                data += line
                            if findall(pattern=b"MLP_Save>",
                                       string=line):
                                trigger = False
                    if len(data) >= 200000:
                        print("    Данные найдены. Обработка данных.")
                        data = sub(pattern=rb'^.*<MLP_Save',
                                   repl=b'<MLP_Save',
                                   string=data)
                        data = sub(pattern=rb'MLP_Save>.*$',
                                   repl=b'MLP_Save>',
                                   string=data)
                        data = sub(pattern=rb'\x00 ',
                                   repl=b'" ',
                                   string=data)
                        data = sub(pattern=rb'\x00"',
                                   repl=b'="',
                                   string=data)
                        data = sub(pattern=rb'\x00<',
                                   repl=b'><',
                                   string=data)
                        data = sub(pattern=rb'\x00/>',
                                   repl=b'"/>',
                                   string=data)
                        data = sub(pattern=rb'\x00>',
                                   repl=b'">',
                                   string=data)
                        data = sub(pattern=rb'\x00',
                                   repl=b' ',
                                   string=data)
                        data = sub(pattern=rb'><',
                                   repl=b'>\n<',
                                   string=data)
                        data = sub(pattern=rb'^<([\w\.]+)">$',
                                   repl=rb'<\1/>',
                                   string=data,
                                   flags=MULTILINE)
                        print(f"    Создание файла mlp_save_prime_{ii}.xml")
                        with open(file=f"mlp_save_prime_{ii}.xml",
                                  mode="w",
                                  encoding="UTF-8") as mlp_save_prime_xml:
                            mlp_save_prime_xml.write(data.decode(encoding="UTF-8",
                                                                 errors="ignore"))
                        ii += 1
                    i += 1
                except Exception:
                    print(f"При обработке файла {join('bin', file)} возникла ошибка. "
                          f"Файл пропущен.")
        else:
            print("В папке bin нет файлов. "
                  "Загрузите в нее бинарные файлы в которых нужно найти данные.")
            input()
            exit()
    else:
        makedirs(name="bin")
        print("Папки bin не существует. "
              "Была создана пустая папка. "
              "Загрузите в нее бинарные файлы в которых нужно найти данные.")
        input()
        exit()
