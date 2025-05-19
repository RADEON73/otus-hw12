import pandas as pd

# Укажите путь к файлу
file_path = "input/AB_NYC_2019.csv"

try:
    # Загрузка без заголовков (header=None)
    df = pd.read_csv(file_path, header=None)
    
    # Назначаем названия столбцов вручную (нужно знать порядок!)
    # Пример для вашего формата (уточните реальный порядок столбцов):
    df.columns = [
        'id', 'name', 'host_id', 'host_name', 'neighbourhood_group',
        'neighbourhood', 'latitude', 'longitude', 'room_type', 'price',
        'minimum_nights', 'number_of_reviews', 'last_review',
        'reviews_per_month', 'calculated_host_listings_count',
        'availability_365'
    ]
    
    print("Файл успешно загружен! Первые 5 строк:")
    print(df.head())
    
    # Проверяем, что столбец 'price' существует
    if 'price' not in df.columns:
        print("\nОшибка: неверные названия столбцов. Фактические столбцы:")
        print(df.columns)
        exit()
    
    # Расчет статистик
    mean_price = df['price'].mean()
    var_price = df['price'].var(ddof=0)  # Генеральная дисперсия
    
    print("\nРезультаты:")
    print(f"Средняя цена: {mean_price:.2f} $")
    print(f"Дисперсия: {var_price:.2f}")
    
except Exception as e:
    print(f"\nОшибка: {e}")

input("\nНажмите Enter для выхода...")