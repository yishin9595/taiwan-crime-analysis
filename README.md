# Crime data analysis in Taiwan (2020–2024)

### 專案介紹
- **目的**：觀察近 2020–2024 年台灣犯罪率狀況，作為租屋、購屋族以及相關單位治安部署參考
- **資料來源**：警政署犯罪資料、人口統計資料、新北臺北實價登錄
- **工具使用情境**：
  - BigQuery：進行 SQL 資料查詢
  - Google Sheets、Excel：製作圖表
  - Google Slides：製作簡報
- **主要發現**：
  - 整體趨勢
      - 犯罪率五年降兩成，2024 年首見反彈；桃園市犯罪率下降幅度高，建議可找出成功因素並複用到其他縣市，加強並延續治安成效
      - 1、4、7、8、10月犯罪量高於平均，可能連假人口流動多，造成部分治安上升，建議假期前提早治安部署
      - 住宅竊盜急增，建議加強熱區防竊；汽機車犯罪率穩定持平，建議持續推廣防盜設備與公共停車場監視密度，穩定治安趨勢
      - 強盜犯罪率下降、強制性交有上升趨勢，建議加強巡邏與治安部署
  - 犯罪熱點
      - 基隆市、桃園市、嘉義市為犯罪熱點縣市，近年再度升溫，建議租屋購屋族避開高風險地區，留意治安變化趨勢；犯罪種類以毒品與竊盜為主，建議加強防毒宣導與防竊意識，降低重複犯罪風險
  - 雙北房價與治安
      - 萬華區治安風險較高，建議租屋購屋時優先避開，北投、文山、士林、內湖與中正區兼具房價與治安優勢，性價比高，可優先考慮
      - 三重區房價與犯罪率皆高，需承擔較高的治安風險；石門、石碇、三芝等區房價與犯罪率皆低，但通勤時間長，租屋、購屋族也需納入評估

---

### 資料處理流程
   - 整合各年度、季度犯罪資料為單一檔案
   - 年份轉換：民國 → 西元
   - 日期欄位合併：年 / 月 / 日 → date
   - 縣市名稱格式統一（台 → 臺）
  
---

### 分析結果
- **Google Slide 簡報**  
  👉 [完整分析簡報](https://docs.google.com/presentation/d/1G3O7ZntmjPxTPSVXK79H85h6Zx8aA6TuMZMt5MP1bj0/edit?slide=id.g370e269f5d5_1_1057#slide=id.g370e269f5d5_1_1057)
- **Google Sheets 圖表**  
  👉 [數據資料與圖表](https://docs.google.com/spreadsheets/d/1um-dsKPqy3yix9wQ0e7VcDM6f_0vciWpmA8zz6HE4Dw/edit?usp=drive_link)

---

### SQL Scripts
- [每年各縣市犯罪率](sql_scripts/01_crime_rate_per_10k.sql)
- [每年每月犯罪種類](sql_scripts/02_crime_records_by_date.sql)
- [2024 v.s 2020 犯罪率變化](sql_scripts/03_crime_rate_pct_change_2024_vs_2020.sql)
- [雙北犯罪率 v.s 房價分析](sql_scripts/04_crime_rate_vs_price_by_district_tpe_ntpc.sql)

