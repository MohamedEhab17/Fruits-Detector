# 🍊 Fruits Detector 🍇

A simple AI-powered mobile app that classifies fruits (Grapes vs Oranges) using a CNN model, built for a Neural Networks course project.

- 🎓 Faculty of Computers & AI, Benha University – 3rd year CS
- 📱 Built with Flutter (Frontend)
- 🧠 CNN Model served with Flask (Backend)

---
## 📸 Demo

Here are some screenshots from the app:

### 🏠 Home Screen
![Home Screen](https://github.com/MohamedEhab17/Fruits-Detector/blob/master/Screenshots/1.jpg?raw=true)

### 🖼️ Gallery Detection
![Gallery Detection](https://github.com/MohamedEhab17/Fruits-Detector/blob/master/Screenshots/2.jpg?raw=true)

### 📷 Camera Detection
![Camera Detection](https://github.com/MohamedEhab17/Fruits-Detector/blob/master/Screenshots/3.jpg?raw=true)

### 🌗 Theme Support (Dark & Light)  
![Theme Support](https://github.com/MohamedEhab17/Fruits-Detector/blob/master/Screenshots/4.jpg?raw=true)

### 🌍 Localization Support  
![Localization Support](https://github.com/MohamedEhab17/Fruits-Detector/blob/master/Screenshots/5.jpg?raw=true)

---

## 🚀 Features

- Real-time fruit classification (grapes vs oranges)
- Clean UI with **MVVM architecture**
- **Cubit** for state management
- Localization (multi-language support)
- Works with camera or picked images
- Local API integration using **Flask**

---

## 🧰 Tech Stack

### Flutter Frontend
- `flutter_bloc`, `camera`, `image_picker`, `http`, `card_swiper`, `spinkit`, `easy_localization`, `shared_preferences`, and more

### Python Backend
- Flask
- TensorFlow / Keras (for loading the trained CNN model)

---
### 🧠 Model Info
- Input: Images of size 200x200
- Output: Label - Grapes or Oranges with confidence score
- Built using CNN in Keras
---
### 📂 Project Structure
```bash
fruits-detector/
│
├── backend/ # Flask API + CNN model
│ ├── app.py
│ ├── model.h5
│ └── requirements.txt
│
├── fruits_app/ # Flutter frontend
│ ├── lib/
│ │ ├── main.dart
│ │ ├── core/
│ │ │ ├── services/
│ │ │ │ ├── app_info_helper.dart
│ │ │ │ ├── image_classifier.dart
│ │ │ ├── theme/
│ │ │ ├── app_theme.dart
│ │ ├── cubits/
│ │ │ ├── theme_cubit/
│ │ ├── features/
│ │ │ ├── camera/
│ │ │ │ ├── model/
│ │ │ │ ├── view/
│ │ │ │ │ ├── camera_view.dart
│ │ │ │ │ ├── gallery_view.dart
│ │ │ │ ├── view_model/
│ │ │ │ │ ├── image_predictor_cubit.dart
│ │ │ │ │ ├── image_predictor_state.dart
│ │ │ │ ├── widgets/
│ │ │ │ │ ├── camera_preview_with_result.dart
│ │ │ │ │ ├── prediction_result.dart
│ │ │ │ │ ├── select_image_button.dart
│ │ │ ├── home/
│ │ │ │ ├── home_view.dart
│ │ │ │ ├── view_model/
│ │ │ │ │ ├── home_cubit.dart
│ │ │ │ ├── widgets/
│ │ │ │ │ ├── camera_image_card_widget.dart
│ │ │ ├── settings/
│ │ │ │ ├── view/
│ │ │ │ │ ├── settings_view.dart
│ │ │ │ ├── view_model/
│ │ │ │ │ ├── setting_cubit.dart
│ │ │ │ ├── widgets/
│ │ │ │ │ ├── setting_list_tile.dart
│ │ │ │ │ ├── setting_switch_list_tile.dart
│ │ │ │ │ ├── social_services.dart
│ │ │ ├── splash/
│ │ │ │ ├── splash_view.dart
│ │ │ ├── theme/
│ │ │ │ ├── view_model/
│ │ │ │ ├── ...
│
└── README.md
```
---


## 🛠️ How to Run the Project

### 1️⃣. Clone the Repository

```bash
git clone https://github.com/your-username/fruits-detector.git
cd fruits-detector

```
---

### 2️⃣.  Setup Backend (Flask API)
```bash
cd backend
python -m venv venv
venv\Scripts\activate        # (Windows)
pip install -r requirements.txt
python app.py
```
✅ Make sure you have Python installed and the model.h5 file is inside the backend folder.
----
### 3️⃣. Update API IP in Flutter Code
- Open the Flutter project
- Find the part where the API endpoint is defined (in core folder in services in image_classifier.dart file)
- Replace:
```bash
  final String apiUrl = 'http://192.168.1.3:5000/predict';
```
- with your local IP address:
```bash
final url = 'http://192.168.X.X:5000/predict';
```
🧠 You can find your IP using ipconfig on Windows.
---
### 4️⃣ Run the Flutter App
```bash
flutter pub get
flutter run
```
- Connect a physical device or use an emulator
- Make sure your device and computer are on the same Wi-Fi network
---

## 📬 Contact

If you have any questions, suggestions, or would like to collaborate, feel free to reach out:

- ✉️ Email: mohamedehap172004@gmail.com  
- 🔗 LinkedIn: [https://www.linkedin.com/in/mohamed-ehab-017385271/](https://www.linkedin.com/in/mohamed-ehab-017385271/)  
- 💻 GitHub: [https://github.com/MohamedEhab17](https://github.com/MohamedEhab17)

---

⭐ If you like this project, don't forget to give it a star!

