class tts_beam
{
	class beam
	{
		file = "scripts\tts_beam\functions";
		class beam {};
		class orbitalBombardment {};
		class rayParticles {};
		class ragdollUnit {};
		class explosionDamage {};
		class explosionParticles {};
		class postProcessEffects {};
		
	};
	class zen
	{
		file = "scripts\tts_beam\functions\zen";
		class initCustomModules { preInit = 1; };
		class zen_moduleBeamStrike {};
		class zen_moduleOrbitalBombardment {};
	};
};