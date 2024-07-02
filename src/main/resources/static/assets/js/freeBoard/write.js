 const contentTextarea = document.getElementById('content');
        const charCountDiv = document.getElementById('charCount');

        contentTextarea.addEventListener('input', () => {
            const currentLength = contentTextarea.value.length;
            charCountDiv.textContent = `${currentLength} / 200`;
        });

        // write button event
                document.querySelector('.list-btn').onclick = e => {
                  window.location.href = '/freeBoard/list';
                };