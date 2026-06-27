<script>
	import { onMount } from 'svelte';

	let canvas;

	function parseHex(hex) {
		let h = (hex || '').replace('#', '').trim();
		if (h.length === 3) h = h[0] + h[0] + h[1] + h[1] + h[2] + h[2];
		const n = parseInt(h, 16);
		if (isNaN(n) || h.length !== 6) return null;
		return [(n >> 16) & 255, (n >> 8) & 255, n & 255];
	}

	onMount(() => {
		const ctx = canvas.getContext('2d');
		const N = 72;
		const heights = new Float32Array(N);
		let w = 0;
		let h = 0;
		let raf;

		const css = getComputedStyle(document.documentElement).getPropertyValue('--accent');
		const [r, g, b] = parseHex(css) || [150, 100, 255];

		const reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

		const resize = () => {
			const dpr = window.devicePixelRatio || 1;
			const rect = canvas.getBoundingClientRect();
			w = rect.width;
			h = rect.height;
			canvas.width = Math.max(1, Math.round(w * dpr));
			canvas.height = Math.max(1, Math.round(h * dpr));
			ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
		};
		const ro = new ResizeObserver(resize);
		ro.observe(canvas);
		resize();

		const draw = (now) => {
			const t = now / 1000;
			ctx.clearRect(0, 0, w, h);
			const barW = w / N;
			const bw = barW * 0.6;
			for (let i = 0; i < N; i++) {
				const x = i / N;
				let v = 0.5 + 0.5 * Math.sin(x * 9 + t * 1.7);
				v *= 0.6 + 0.4 * Math.sin(x * 3.3 - t * 1.1);
				v = v * 0.6 + 0.24 * (0.5 + 0.5 * Math.sin(t * 2.6 + i * 0.4)) + 0.12 * (0.5 + 0.5 * Math.sin(t * 5 + i));
				v *= 0.55 + 0.45 * Math.sin(x * Math.PI);
				v = Math.max(0.04, Math.min(1, v));
				const cur = heights[i];
				heights[i] = v > cur ? cur + (v - cur) * 0.35 : cur + (v - cur) * 0.12;
				const bh = heights[i] * h * 0.92;
				const bx = i * barW + (barW - bw) / 2;
				const grad = ctx.createLinearGradient(0, h, 0, h - bh);
				grad.addColorStop(0, `rgba(${r},${g},${b},0.85)`);
				grad.addColorStop(1, `rgba(${r},${g},${b},0.12)`);
				ctx.fillStyle = grad;
				ctx.fillRect(bx, h - bh, bw, bh);
			}
			if (!reduce) raf = requestAnimationFrame(draw);
		};

		raf = requestAnimationFrame(draw);

		return () => {
			cancelAnimationFrame(raf);
			ro.disconnect();
		};
	});
</script>

<canvas bind:this={canvas} class="bg-spectrum" aria-hidden="true"></canvas>

<style>
	.bg-spectrum {
		position: fixed;
		left: 0;
		right: 0;
		bottom: 0;
		width: 100vw;
		height: 58vh;
		z-index: -1;
		pointer-events: none;
		filter: blur(7px);
		opacity: 0.5;
		-webkit-mask-image: linear-gradient(to top, #000 0%, #000 32%, transparent 92%);
		mask-image: linear-gradient(to top, #000 0%, #000 32%, transparent 92%);
	}
	@media (max-width: 460px) {
		.bg-spectrum {
			height: 42vh;
		}
	}
</style>
