<!DOCTYPE html>
<html lang="ru">
<head>
    <link rel="icon" href="/images/znakkr.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Оксимирон — Главная</title>
    <style>
        body {
            margin: 0;
            font-family: 'Oswald', sans-serif;
            color: white;
            overflow-x: hidden;
        }

        /* Параллакс фон */
        .parallax-bg {
            background: url('images/mainback.png') no-repeat center center;
            background-size: cover;
            background-attachment: fixed; /* Параллакс-эффект */
            min-height: 100vh;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        /* Фиксированная навигационная панель */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            background-color: rgba(0, 0, 0, 0.7); /* Полупрозрачный фон */
            padding: 10px 0;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
        }

        .navbar a:hover {
            color: #d2b215;
        }

        /* Контент */
        .content {
            padding: 120px 20px 20px; /* Добавлено дополнительное пространство сверху для навигации */
            color: white;
        }

        h1 {
            font-size: 3rem; /* Используем единицы rem для адаптивности */
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.7);
            margin-bottom: 20px;
        }

        p {
            font-size: 1.5rem;
            margin-bottom: 30px;
            text-shadow: 1px 1px 10px rgba(0, 0, 0, 0.5);
        }

        /* Одноцветный фон для следующей секции */
        .solid-bg {
            background-color: #0f0f0f; /* Задайте желаемый цвет фона */
            padding: 60px 20px; /* Добавьте отступы */
            text-align: center;
        }

        /* Стиль для карусели альбомов */
        #albumCarousel {
            margin-top: 60px; /* Уменьшаем отступ для лучшего отображения */
        }

        .carousel-inner {
            margin: 0 auto; /* Центрируем карусель */
        }

        .carousel-item {
            border-radius: 15px;
            background: transparent;
        }

        .album {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            margin: 20px;
            padding-top: 20px;
        }

        .album img {
            width: 100%;
            max-width: 300px; /* Установим максимальную ширину */
            height: auto; /* Адаптивная высота */
            display: block;
            border-radius: 50px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .album img:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
        }

        .album h3 {
            color: #d4af37;
            padding: 10px 0;
            font-size: 1.5rem;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.5);
        }

        .album p {
            color: #f0f0f0;
            padding: 0 15px 20px;
            font-size: 1rem;
            line-height: 1.5;
        }

        .carousel-control-prev,
        .carousel-control-next {
            filter: invert(1);
        }

        footer {
            text-align: center;
            padding: 20px;
        }

        footer a {
            color: white;
            margin: 0 15px;
        }

        footer a:hover {
            color: #d2b215;
        }

        /* Стиль для бургер меню */
        .menu {
            position: fixed; /* Фиксированное положение */
            top: 10px; /* Отступ сверху */
            right: 20px; /* Отступ справа */
            z-index: 1001;
        }

        .burger {
            position: relative;
            border: none;
            background: transparent; /* Фон прозрачный */
            width: 40px;
            height: 26px;
            cursor: pointer; /* Добавлено для изменения курсора */
        }

        .burger::before,
        .burger::after {
            content: '';
            left: 0;
            position: absolute;
            display: block;
            width: 100%;
            height: 4px;
            border-radius: 10px;
            background: #ffffff;
        }

        .burger::before {
            top: 0;
            box-shadow: 0 11px 0 #000;
            transition: top .3s, transform .3s;
        }

        .burger::after {
            bottom: 0;
            transition: bottom .3s, transform .3s;
        }

        .burger.active::before {
            top: 11px;
            transform: rotate(45deg);
            box-shadow: 0 6px 0 rgba(0,0,0,0);
        }

        .burger.active::after {
            bottom: 11px;
            transform: rotate(-45deg);
        }

        .menu-list {
            display: none; /* Скрываем меню по умолчанию */
            list-style: none;
            padding: 0;
            margin: 0;
            background: rgba(0, 0, 0, 0.7); /* Полупрозрачный фон для меню */
            position: absolute;
            top: 50px; /* Позиционирование ниже бургер-меню */
            right: 0;
            width: 200px; /* Ширина меню */
            border-radius: 5px;
            z-index: 1002;
        }

        .menu-list.active {
            display: block; /* Показываем меню при активном классе */
        }

        .menu-item {
            display: block;
            padding: 10px 15px;
            color: white;
            text-decoration: none;
        }

        .menu-item:hover {
            color: #d2b215;
            background: #ffffff; /* Подсветка при наведении */
            text-decoration: none; /* Убираем подчеркивание при наведении */
        }
        .burger div {
            position: absolute; /* Позиционирование для центральной линии */
            top: 11px; /* Положение в середине бургер-меню */
            left: 0;
            width: 100%;
            height: 4px; /* Высота центральной линии */
            background: #ffffff; /* Цвет для центральной линии */
            border-radius: 10px; /* Радиус для закругления */
            transition: background .3s; /* Плавный переход при наведении */
        }
        .burger.active div {
            background: rgba(255, 87, 51, 0);
            display: none;/* Прозрачный при активном состоянии */
        }
        .video-container {
            position: relative;
            padding-bottom: 56.25%; /* Соотношение 16:9 (9/16 = 0.5625) */
            height: 0;
            overflow: hidden;
            max-width: 100%; /* Установите максимальную ширину */
            border-radius: 10px;
        }

        .video-container iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%; /* Высота будет 100% родительского контейнера */
        }
        .visualizer {
            display: flex;
            justify-content: center;
            align-items: flex-end;
            height: 100px; /* Высота визуализатора */
            width: 100%;
            margin-top: 20px;
            background-color: #111; /* Цвет фона для визуализатора */
        }
        .bar {
            width: 5px; /* Ширина полос */
            margin: 0 1px; /* Отступы между полосами */
            background-color: #FF5733; /* Цвет полос эквалайзера */
            transition: height 0.1s; /* Плавная анимация высоты */
            opacity: 0.7; /* Установим немного прозрачности для лучшего вида */
        }

        /* Медиа-запросы для адаптивности */
        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }

            p {
                font-size: 1rem;
            }

            .album img {
                max-width: 100%; /* На мобильных устройствах изображение будет 100% ширины */
            }

            .navbar {
                padding: 5px 0;
            }
        }
    </style>
</head>
<body>

<!-- Черная полоса навигации -->
<div class="menu">
    <input type="checkbox" id="burger-checkbox" class="burger-checkbox" hidden>
    <label for="burger-checkbox" class="burger">
        <div></div>
    </label>
    <ul class="menu-list">
        <li><a href="http://localhost:8084" class="menu-item">Oxxxymiron</a></li>
        <li><a href="http://localhost:8084/tours" class="menu-item">Туры</a></li>
        <li><a href="http://localhost:8084/contact" class="menu-item">Связь</a></li>
        <li><a href="http://localhost:8084/login" class="menu-item">Зарегистрироваться</a></li>
    </ul>
</div>

<!-- Основной контент -->
<div class="parallax-bg">
    <div class="content">
        <h1>Оксимирон</h1>
        <p>1703</p>
    </div>
</div>

<!-- Одноцветный фон -->
<div class="solid-bg">

    <!-- Карусель альбомов -->
    <div id="albumCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <#if albums?size == 0>
                <div class="alert alert-warning">Нет доступных альбомов.</div>
            <#else>
                <#list albums as album>
                    <div class="carousel-item <#if album?index == 0>active</#if>">
                        <div class="album">
                            <a href="${album.link}" target="_blank">
                                <img src="${album.imageUrl}" alt="Обложка альбома" class="d-block img-fluid"/>
                                <h3>${album.title}</h3>
                            </a>
                        </div>
                    </div>
                </#list>
            </#if>
        </div>
        <a class="carousel-control-prev" href="#albumCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#albumCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <div class="youtube-video" style="text-align: center; margin: 40px 0;">
        <div class="video-container">
            <iframe
                    id="youtube-video"
                    src="https://www.youtube.com/embed/SzRKUiEByoA?enablejsapi=1"
                    frameborder="0"
                    allowfullscreen>
            </iframe>
        </div>
        <div id="visualizer" class="visualizer"></div>
    </div>

    <footer>
        <a href="https://t.me/norimyxxxo" target="_blank">
            <i class="fab fa-telegram fa-2x"></i>
        </a>
        <a href="https://music.yandex.ru/artist/249991" target="_blank">
            <i class="fas fa-music fa-2x"></i>
        </a>
    </footer>

    <!-- Скрипты -->
    <script src="https://www.youtube.com/iframe_api"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.botpress.cloud/webchat/v2.1/inject.js"></script>
    <script src="https://mediafiles.botpress.cloud/b34b0e15-6605-4aa1-ae95-b9f2d9b5e8a2/webchat/v2.1/config.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Инициализация Botpress
            try {
                window.botpressWebChat.init({
                    botId: 'b34b0e15-6605-4aa1-ae95-b9f2d9b5e8a2',
                    host: 'https://cdn.botpress.cloud',
                    messagingUrl: 'https://mediafiles.botpress.cloud/b34b0e15-6605-4aa1-ae95-b9f2d9b5e8a2'
                });
                console.log('Botpress Web Chat initialized');
            } catch (error) {
                console.error('Failed to initialize Botpress Web Chat:', error);
            }

            // Улучшенное бургер-меню
            const burger = document.querySelector('.burger');
            const menuList = document.querySelector('.menu-list');

            burger.addEventListener('click', () => {
                burger.classList.toggle('active');
                menuList.classList.toggle('active'); // Показываем/скрываем меню
            });
        });

        let player;
        const visualizer = document.getElementById('visualizer');
        const audioContext = new (window.AudioContext || window.webkitAudioContext)();
        const analyser = audioContext.createAnalyser();
        const bufferLength = analyser.frequencyBinCount;
        const dataArray = new Uint8Array(bufferLength);

        // Инициализация YouTube IFrame API
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('youtube-video', {
                events: {
                    'onReady': onPlayerReady
                }
            });
        }

        // Когда плеер готов, запускаем анализ аудио
        function onPlayerReady(event) {
            // Создаем видео элемент для анализа
            const mediaElement = document.createElement('video');
            mediaElement.src = event.target.getVideoData().video_url; // Получаем URL видео (для доступа к аудио)

            // Создаем источник для анализа
            const source = audioContext.createMediaElementSource(mediaElement);
            source.connect(analyser);
            analyser.connect(audioContext.destination);

            // Создаем полосы для визуализации
            createBars();
            visualize();
        }

        // Создание полос для эквалайзера
        function createBars() {
            for (let i = 0; i < bufferLength; i++) {
                const bar = document.createElement('div');
                bar.className = 'bar';
                visualizer.appendChild(bar);
            }
        }

        // Функция для визуализации
        function visualize() {
            requestAnimationFrame(visualize);
            analyser.getByteFrequencyData(dataArray);

            const bars = document.querySelectorAll('.bar');
            bars.forEach((bar, index) => {
                const height = dataArray[index]; // Получаем высоту полосы в зависимости от громкости
                bar.style.height = height + 'px'; // Устанавливаем высоту полосы
            });
        }
    </script>
</div>
</body>
</html>
