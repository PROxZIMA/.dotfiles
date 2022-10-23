function getOffset(el) {
  const rect = el.getBoundingClientRect();
  return {
    left: rect.left + window.scrollX,
    top: rect.top + window.scrollY,
  };
}

const prevOffset = {};

const displayEffect = (event) => {
  if (prevOffset.top === undefined) {
    let initialOffset = getOffset(document.getElementsByClassName("cursor")[0]);
    prevOffset.top = initialOffset.top;
    prevOffset.left = initialOffset.left;
  }

  const existingRect = document.getElementById("myRect");
  if (existingRect !== null) {
    existingRect.remove();
  }

  setTimeout(function () {
    const currOffset = getOffset(document.getElementsByClassName("cursor")[0]);
    const top = prevOffset.top;
    const left = prevOffset.left;
    const rect = document.createElement("div");

    // console.log("prev: ", top, left);
    // console.log("curr: ", currOffset.top, currOffset.left);

    rect.id = "myRect";
    rect.style.cssText = `
      position:absolute;
      top:${top}px;
      left:${left}px;
      width:9px;
      height:20px;
      z-index:10;
      background-color:red;
      opacity: 0.5;
    `;
    rect.animate(
      [
        // keyframes
        { transform: "scale(1) skew(10deg)" },
        { transform: "scale(0) skew(10deg)" },
      ],
      {
        // timing options
        duration: 500,
        easing: "ease-in-out",
        direction: "alternate",
        iterations: Infinity,
      }
    );

    document.body.appendChild(rect);
    prevOffset.top = currOffset.top;
    prevOffset.left = currOffset.left;
  }, 24);
};

// NOTE: First enable editor.cursorSmoothCaretAnimation.
// NOTE: Uncomment this to get a cursor trail effect.
// document.addEventListener("keydown", displayEffect);

const windowControls = document.createElement('div');
windowControls.className = 'window-controls-container';
const minimize = document.createElement('div');
minimize.classList.add('window-icon', 'window-minimize', 'codicon', 'codicon-chrome-minimize');
const restore = document.createElement('div');
restore.classList.add('window-icon', 'window-max-restore', 'codicon', 'codicon-chrome-restore');
const close = document.createElement('div');
close.classList.add('window-icon', 'window-close', 'codicon', 'codicon-chrome-close');
windowControls.appendChild(minimize);
windowControls.appendChild(restore);
windowControls.appendChild(close);
// const html = '<div class="window-controls-container"><div class="window-icon window-minimize codicon codicon-chrome-minimize"></div><div class="window-icon window-max-restore codicon codicon-chrome-restore"></div><div class="window-icon window-close codicon codicon-chrome-close"></div></div>';
// template.innerHTML = html;
// const windowControls = template.content.firstChild;

var observer = new MutationObserver(function (mutations, me) {
  console.warn('Observing if window controls present');
  // const windowControls = document.querySelector(".window-controls-container");
  const tabContainer = document.querySelector(".tabs-and-actions-container");

  if (windowControls && tabContainer) {
    tabContainer.appendChild(windowControls);
    console.warn('Observing completed');
    me.disconnect();
    return;
  }
});


// observer.observe(document, {
//   childList: true,
//   subtree: true
// });
