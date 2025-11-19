<svelte:head>
	<title>WAVES - Keyboard Shortcuts</title>
	<meta name="description" content="Keyboard shortcuts for WAVES audio player" />
</svelte:head>

<main>
	<div class="container">
		<div class="header fade-in">
			<div class="title-with-icon">
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24"><path fill="currentColor" d="M12 1h2v8h8v4h-2v-2h-8V5h-2V3h2zM8 7V5h2v2zM6 9V7h2v2zm-2 2V9h2v2zm10 8v2h-2v2h-2v-8H2v-4h2v2h8v6zm2-2v2h-2v-2zm2-2v2h-2v-2zm0 0h2v-2h-2z"/></svg>
				<h1>keyboard shortcuts</h1>
			</div>
			<a href="/" class="back-link">
				<svg class="back-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M20 11v2H8v2H6v-2H4v-2h2V9h2v2zM10 7H8v2h2zm0 0h2V5h-2zm0 10H8v-2h2zm0 0h2v2h-2z"/></svg>
				<span>back</span>
			</a>
		</div>

		<div class="shortcuts-content fade-in delay-1">
			<div class="shortcut-section">
				<h2>navigation</h2>
				<div class="shortcut-item">
					<code>h</code> <code>j</code> <code>k</code> <code>l</code>
					<span>navigate</span>
				</div>
				<div class="shortcut-item">
					<code>enter</code> <code>l</code>
					<span>select/play</span>
				</div>
				<div class="shortcut-item">
					<code>tab</code>
					<span>cycle views</span>
				</div>
			</div>

			<div class="shortcut-section">
				<h2>playback</h2>
				<div class="shortcut-item">
					<code>space</code>
					<span>pause/resume</span>
				</div>
				<div class="shortcut-item">
					<code>←</code> <code>→</code>
					<span>prev/next track</span>
				</div>
				<div class="shortcut-item">
					<code>↑</code> <code>↓</code>
					<span>volume</span>
				</div>
			</div>

			<div class="shortcut-section">
				<h2>file operations</h2>
				<div class="shortcut-item">
					<code>y</code>
					<span>yank (copy)</span>
				</div>
				<div class="shortcut-item">
					<code>x</code>
					<span>cut</span>
				</div>
				<div class="shortcut-item">
					<code>p</code>
					<span>paste</span>
				</div>
				<div class="shortcut-item">
					<code>r</code>
					<span>rename</span>
				</div>
				<div class="shortcut-item">
					<code>d</code>
					<span>delete</span>
				</div>
				<div class="shortcut-item">
					<code>n</code>
					<span>new folder</span>
				</div>
			</div>

			<div class="shortcut-section">
				<h2>other</h2>
				<div class="shortcut-item">
					<code>?</code>
					<span>show all shortcuts</span>
				</div>
				<div class="shortcut-item">
					<code>m</code>
					<span>edit metadata</span>
				</div>
				<div class="shortcut-item">
					<code>f</code>
					<span>toggle favorite</span>
				</div>
			</div>
		</div>
	</div>
</main>

<style>
	main {
		width: 100%;
		min-height: 100vh;
		display: flex;
		justify-content: center;
		padding: 2rem 1rem;
	}

	.container {
		max-width: 600px;
		width: 100%;
	}

	.header {
		text-align: center;
		margin-bottom: 3rem;
	}

	.title-with-icon {
		display: flex;
		align-items: center;
		justify-content: center;
		gap: 0.75rem;
		margin-bottom: 1rem;
	}

	.title-with-icon svg {
		flex-shrink: 0;
		color: var(--text-white);
	}

	h1 {
		font-size: 2rem;
		letter-spacing: 0.2rem;
		margin-bottom: 0;
		color: var(--text-white);
		font-weight: normal;
		text-transform: lowercase;
	}

	.back-link {
		display: inline-flex;
		align-items: center;
		gap: 0.4rem;
		color: var(--text-gray);
		font-size: 0.85rem;
		text-decoration: none;
	}

	.back-link:hover {
		color: var(--text-white);
	}

	.back-icon {
		display: flex;
		flex-shrink: 0;
	}

	.shortcuts-content {
		display: flex;
		flex-direction: column;
		gap: 2.5rem;
	}

	.shortcut-section h2 {
		color: var(--text-white);
		font-size: 0.9rem;
		font-weight: normal;
		text-transform: lowercase;
		margin-bottom: 1rem;
		letter-spacing: 0.1rem;
	}

	.shortcut-item {
		display: flex;
		align-items: center;
		gap: 1rem;
		padding: 0.5rem 0;
		border-bottom: 1px solid #222;
	}

	.shortcut-item:last-child {
		border-bottom: none;
	}

	.shortcut-item code {
		background-color: transparent;
		color: var(--text-white);
		padding: 0.2rem 0.5rem;
		font-family: 'gohu', monospace;
		font-size: 0.85rem;
		border: 1px solid var(--text-white);
		border-radius: 3px;
	}

	.shortcut-item span {
		color: var(--text-gray);
		font-size: 0.9rem;
	}

	.fade-in {
		opacity: 0;
		animation: fadeIn 0.8s ease forwards;
	}

	.delay-1 {
		animation-delay: 0.2s;
	}

	@keyframes fadeIn {
		from {
			opacity: 0;
			transform: translateY(15px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}

	@media (max-width: 768px) {
		h1 {
			font-size: 1.5rem;
		}

		.shortcut-item {
			flex-wrap: wrap;
		}
	}
</style>
