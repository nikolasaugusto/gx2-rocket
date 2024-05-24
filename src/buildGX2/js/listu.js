Liferay.on('allPortletsReady', function () {
    const addTaskBtn = document.getElementById('add-task-btn');
    addTaskBtn.addEventListener('click', addTask);

    const savedTasks = JSON.parse(localStorage.getItem('tasks')) || [];
    renderTasks(savedTasks);

    function addTask() {
        const taskInput = document.getElementById('task-input');
        const descriptionInput = document.getElementById('description-input');
        const dueDateInput = document.getElementById('due-date');

        const taskText = taskInput.value.trim();
        const description = descriptionInput.value.trim();
        const dueDate = dueDateInput.value;

        if (taskText === '') {
            alert('Por favor, insira uma tarefa.');
            return;
        }

        const newTask = {
            task: taskText,
            description: description,
            dueDate: dueDate,
            completed: false
        };


        savedTasks.push(newTask);


        localStorage.setItem('tasks', JSON.stringify(savedTasks));


        renderTasks(savedTasks);

        taskInput.value = '';
        descriptionInput.value = '';
        dueDateInput.value = '';
    }

    function renderTasks(tasks) {
        const taskList = document.getElementById('task-list');
        taskList.innerHTML = '';

        tasks.forEach(task => {
            const taskItem = document.createElement('li');
            taskItem.classList.add('task-item');

            const taskContent = document.createElement('span');
            taskContent.textContent = task.task;
            taskContent.contentEditable = true;
            taskContent.classList.add('task-content');

            const checkbox = document.createElement('input');
            checkbox.type = 'checkbox';
            checkbox.checked = task.completed;
            checkbox.addEventListener('change', () => toggleTaskStatus(task));
            checkbox.classList.add('check-box');

            const descriptionDisplay = document.createElement('p');
            descriptionDisplay.textContent = task.description;
            descriptionDisplay.contentEditable = true;
            descriptionDisplay.classList.add('description-display');

            const dateDisplay = document.createElement('span');
            const formattedDate = new Intl.DateTimeFormat('pt-BR', {
                year: 'numeric',
                month: '2-digit',
                day: '2-digit'
            }).format(new Date(task.dueDate));
            dateDisplay.textContent = formattedDate;
            dateDisplay.classList.add('date-display');


            const deleteButton = document.createElement('button');
            deleteButton.type = 'button';
            deleteButton.classList.add('button-delet');
            deleteButton.classList.add('close');
            deleteButton.setAttribute('aria-label', 'Fechar');

            const span = document.createElement('span');
            span.setAttribute('aria-hidden', 'true');
            span.innerHTML = '&times;';
            deleteButton.appendChild(span);

            deleteButton.addEventListener('click', () => deleteTask(task));



            taskItem.appendChild(taskContent);
            taskItem.appendChild(deleteButton);
            taskItem.appendChild(checkbox);
            taskItem.appendChild(descriptionDisplay);
            taskItem.appendChild(dateDisplay);


            taskList.appendChild(taskItem);
        });
    }

    function toggleTaskStatus(task) {
        task.completed = !task.completed;

        localStorage.setItem('tasks', JSON.stringify(savedTasks));

        renderTasks(savedTasks);
    }

    function deleteTask(task) {
        const taskIndex = savedTasks.indexOf(task);
        savedTasks.splice(taskIndex, 1);


        localStorage.setItem('tasks', JSON.stringify(savedTasks));


        renderTasks(savedTasks);
    }
});
