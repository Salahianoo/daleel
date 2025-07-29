# 1. تحميل المشروع من Bitbucket
git clone https://bitbucket.org/اسم-الفريق/اسم-المشروع.git
cd اسم-المشروع

# 2. إنشاء فرع جديد (نسخة شغل خاصة فيك)
git checkout -b feature/اسمك-او-الميزة

# 3. حفظ كل التعديلات اللي سويتها
git add .
git commit -m "شرح بسيط للتعديلات اللي سويتها"

# 4. رفع شغلك إلى Bitbucket
git push origin feature/اسمك-او-الميزة

# 5. بعد ما ينقبل الشغل وترجع للفرع الرئيسي
git checkout develop
git pull origin develop

# 6. دمج التحديثات الجديدة داخل فرعك (اختياري لو ناوي تكمل عليه)
git checkout feature/اسمك-او-الميزة
git merge develop

# 7. حذف الفرع بعد الانتهاء من الشغل
git branch -d feature/اسمك-او-الميزة
git push origin --delete feature/اسمك-او-الميزة
