from os import getcwd, walk, remove
from sys import exit

if __name__ == "__main__":
    try:
        list_files, response, i = [], True, 1
        print("1. Поиск всех LOC файлов...\n")
        for root, dirs, files in walk(top=getcwd()):
            folder = root.replace(f"{getcwd()}\\", "").replace(getcwd(), "").replace("\\", "/")
            list_files.extend([f"{folder}/{x}" if len(folder) > 0 else x for x in files if x.endswith(".loc")])
        if len(list_files) > 0:
            for file in list_files:
                print(f"[{i} из {len(list_files)}] Конвертируем: {file}")
                try:
                    with open(file=file,
                              mode="rb") as input_loc_file:
                        data, data_pointer, ascii_or_utf, output = input_loc_file.read(), 4, 1, ""
                        while data_pointer < len(data):
                            sym_count = data[data_pointer:data_pointer + 4]
                            sym_count = int.from_bytes(bytes=sym_count,
                                                       byteorder="little")
                            data_pointer += 4
                            tmp = data[data_pointer:data_pointer + (sym_count * ascii_or_utf)]
                            if ascii_or_utf == 1:
                                output += tmp.decode(encoding="UTF-8",
                                                     errors="ignore")
                                data_pointer += sym_count * ascii_or_utf
                                ascii_or_utf = 2
                            else:
                                tmp = tmp.decode(encoding="UTF-16-LE",
                                                 errors="ignore")
                                if tmp.endswith("\n"):
                                    tmp = tmp[:-1]
                                if len(tmp) > 0:
                                    output += f"={tmp}\n"
                                else:
                                    output += "\n"
                                data_pointer += sym_count * ascii_or_utf
                                ascii_or_utf = 1
                    try:
                        with open(file=f"{file[:-4]}.txt",
                                  mode="w",
                                  encoding="UTF-8") as output_txt_file:
                            output_txt_file.write(output[:-1])
                    except Exception:
                        print(f"[WARNING] Во время создания файла {file[:-4]}.txt возникла ошибка. "
                              f"Возможно нет прав на создания файлов. "
                              f"Файл пропущен.\n")
                        response = False
                    try:
                        remove(path=file)
                    except Exception:
                        print(f"[WARNING] Во время удаления файла {file} возникла ошибка. "
                              f"Возможно нет прав на удаление файлов. "
                              f"Файл пропущен.\n")
                        response = False
                except Exception:
                    print(f"[WARNING] Во время обработки файла {file} возникла ошибка. "
                          f"Возможно данные в файле повреждены или нет прав на чтение файлов. "
                          f"Файл пропущен.\n")
                    response = False
                i += 1
        else:
            print("[INFO] LOC файлы не найдены.\n")
            response = False
        if response:
            exit()
        else:
            input()
            exit()
    except Exception:
        input()
        exit()
