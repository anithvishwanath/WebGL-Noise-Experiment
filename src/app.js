import * as THREE from 'three';
import {OrbitControls} from 'three/examples/jsm/controls/OrbitControls.js';

export default class Sketch {
	constructor(options) {
		this.container = options.domElement;
		this.width = this.container.offsetWidth;
		this.height = this.container.offsetHeight;

		this.camera = new THREE.PerspectiveCamera( 70, this.width / this.height, 0.01, 10 );
		this.camera.position.z = 1;
		
		this.scene = new THREE.Scene();

		this.renderer = new THREE.WebGLRenderer( { antialias: true } );
		// this.renderer.setPixelRatio(window.devicePixelRatio);
		this.renderer.setPixelRatio(2);
		this.container.appendChild(this.renderer.domElement);
		this.controls = new OrbitControls(this.camera, this.renderer.domElement);

		this.time = 0;
		this.resize();
		this.addObjects();
		this.render();
		this.setUpResize();
	}

	resize() {
		this.width = this.container.offsetWidth;
		this.height = this.container.offsetHeight;
		this.renderer.setSize( this.width, this.height );
		this.camera.aspect = this.width / this.height;
		this.camera.updateProjectionMatrix();
	}

	setUpResize() {
		window.addEventListener('resize', this.resize.bind(this));
	}

	addObjects() {
		this.geometry = new THREE.BoxGeometry( 0.2, 0.2, 0.2 );
		this.material = new THREE.MeshNormalMaterial();
		
		this.mesh = new THREE.Mesh( this.geometry, this.material );
		this.scene.add( this.mesh );
	}

	render() {
		this.time += 0.5;
		this.mesh.rotation.x = this.time / 2000;
		this.mesh.rotation.y = this.time / 1000;
		
		this.renderer.render( this.scene, this.camera );
		requestAnimationFrame(this.render.bind(this));
	}
}

new Sketch({
	domElement: document.getElementById('container')
});

// const width = window.innerWidth, height = window.innerHeight;

// // init

// const camera = new THREE.PerspectiveCamera( 70, width / height, 0.01, 10 );
// camera.position.z = 1;

// const scene = new THREE.Scene();

// const geometry = new THREE.BoxGeometry( 0.2, 0.2, 0.2 );
// const material = new THREE.MeshNormalMaterial();

// const mesh = new THREE.Mesh( geometry, material );
// scene.add( mesh );

// const renderer = new THREE.WebGLRenderer( { antialias: true } );
// renderer.setSize( width, height );
// renderer.setAnimationLoop( animate );
// let container = document.getElementById('container');
// container.appendChild( renderer.domElement );

// // animation

// function animate( time ) {

// 	

// }