'use strict'

//make navbar transparent when it is on the top
const navbar = document.querySelector('#navbar');
const navbarHeight = navbar.getBoundingClientRect().height;
document.addEventListener('scroll', ()=>{
  // console.log(window.scrollY);
  // console.log(`navbarHeight: ${navbarHeight}`);
  //스크롤 될때 y 값, navbar의 높이값을 확인했으니 지워준다.
  if(window.scrollY > navbarHeight){
    navbar.classList.add('navbar--dark');
  } else{
    navbar.classList.remove('navbar--dark');
  }
});

//Handle scrolling when tapping on the navbar menu
const navbarMenu = document.querySelector('.navbar__menu');
navbarMenu.addEventListener('click', (event)=> {
  const target = event.target;
  const link = target.dataset.link;
  if(link == null){
    return;
  }
  // console.log(event.target.dataset.link);
  navbarMenu.classList.remove('open');
  scrollIntoView(link);
});

//Navbar toggle button for small screen
const navbarToggleBtn = document.querySelector('.navbar__toggle-btn');
navbarToggleBtn.addEventListener('click', ()=> {
  navbarMenu.classList.toggle('open');
});

//Handle click on "contact me" button on home
const homeButton = document.querySelector('.home__contact');
homeButton.addEventListener('click',()=>{
  scrollIntoView('#contact');
});

//Make home slowly fade to transparent as the window scrolls down
const home = document.querySelector('.home__container');
const homeHeight = home.getBoundingClientRect().height;
document.addEventListener('scroll',  () => {
  home.style.opacity = 1 - window.scrollY / homeHeight;
});

//Show "arrow up" button when scrolling down
const arrowUp = document.querySelector('.arrow__up');
document.addEventListener('scroll',()=>{
  if(window.scrollY > homeHeight /2){
    arrowUp.classList.add('visible');
  } else{
    arrowUp.classList.remove('visible');
  }
});


//Handle click on the "arrow up" button
arrowUp.addEventListener('click', ()=>{
  scrollIntoView('#home');
});

//projects
const workBtnContainer = document.querySelector('.work__categories');
const projectContainer = document.querySelector('.work__projects');
const projects = document.querySelectorAll('.project'); //모든 프로젝트들을 다 받아온다.
workBtnContainer.addEventListener('click',(e)=> {
  const filter = e.target.dataset.filter || e.target.parentNode.dataset.filter;
  if(filter == null){
    return;
  }

  //Remove selection from the previous item and select the new one
  const active = document.querySelector('.category__btn.selected');
  active.classList.remove('selected'); 
  const target = e.target.nodeName === 'BUTTON' ? e.target: e.target.parentNode;
  // span일 경우 span의 parent node 는 button 이니까 그걸 쓴다. 
  target.classList.add('selected');

  projectContainer.classList.add('anim_out');

  setTimeout(()=> {
    projects.forEach((project)=>{
      console.log(project.dataset.type);
      if(filter==='*' || filter === project.dataset.type){
        project.classList.remove('invisible');
      } else{
        project.classList.add('invisible');
      }
    });  
    projectContainer.classList.remove('anim_out');
  },300);
});

function scrollIntoView(selector){
  const scrollTo = document.querySelector(selector);
  scrollTo.scrollIntoView({behavior:"smooth"});
}