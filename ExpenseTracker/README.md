# 📊 **Expense Tracker**  

An elegant and functional **Expense Tracker** app built with SwiftUI and Combine to manage and visualize personal expenses.

---

## 🚀 **Overview**  
The **Expense Tracker** demonstrates advanced Swift concepts to fetch, process, and display transaction data. It uses an MVVM architecture for a clean separation of concerns, integrates SwiftUI Charts for data visualization, and utilizes Combine for asynchronous data handling.

This project reflects my expertise in Swift development by combining declarative UI design, reactive programming, and data computation.

---

## 🛠️ **Technologies & Concepts**  

### **1. Data Fetching with Combine**  
The app fetches transaction data asynchronously using the Combine framework. It leverages `URLSession` for API requests and processes the fetched data using Combine operators like `tryMap`, `decode`, and `sink`. The results are published to the UI seamlessly.

---

### **2. Data Handling and Computation**  
The app processes transaction data by grouping it by month and calculating cumulative expenses. It uses date-based iteration to compute totals and supports dynamic grouping of transactions for better organization and analysis.

---

### **3. Computed Properties**  
Computed properties are used to simplify logic and formatting within the `Transaction` model. Examples include calculating signed amounts, formatting dates, and dynamically assigning category icons based on transaction data.

---

### **4. SwiftUI Charts Integration**  
The app integrates the SwiftUI Charts library to visualize cumulative expenses over time. It displays data in a clean and interactive line chart format, offering users insights into their spending patterns.

---

### **5. Environment and Environment Objects**  
The app uses `@EnvironmentObject` to share the `TransactionListViewModel` across multiple views. This allows seamless state management and ensures data consistency throughout the app.

---

### **6. Data Mocking for Previews**  
Static preview data is used to create SwiftUI previews for all views. This enables efficient UI development and testing without relying on live API calls.

---

### **7. Modular Reusable Components**  
The app follows a modular design with reusable SwiftUI components like `TransactionRow`, `CategoryRow`, and `TransactionDetailRow`. This improves code maintainability and encourages scalability.

---

### **8. SwiftUI Navigation**  
The app uses `NavigationStack` and `NavigationLink` to enable smooth navigation between views, such as transitioning from a transaction list to detailed transaction views and category selection screens.

---

## 🎓 **What I Learned**  
1. Advanced Combine for data fetching and error handling.  
2. MVVM architecture for clean separation of concerns.  
3. Computed properties to simplify data processing.  
4. Integrating charts for visualizing cumulative expenses.  
5. Managing shared state using `EnvironmentObject`.  
6. Mocking data for effective SwiftUI previews.  
7. Designing modular and reusable UI components.  

---

## 🛠 **Future Improvements**  
- Add data persistence using CoreData or SwiftData.  
- Implement smooth animations for enhanced UI/UX.  
- Introduce advanced features like search and filter functionality.  

---

## 📜 **Conclusion**  
This project showcases my ability to design, build, and optimize iOS apps using **Swift** and **SwiftUI**. It reflects a deep understanding of modern iOS development concepts, including reactive programming, state management, and data visualization.
