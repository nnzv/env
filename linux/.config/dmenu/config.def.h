// use: dmenu-flexipatch
static int topbar = 1;

#if FUZZYMATCH_PATCH
static int fuzzy  = 1;
#endif

#if CENTER_PATCH
static int center = 1;
#endif

#if BORDER_PATCH
static unsigned int border_width = 1;
#endif

#if GRID_PATCH
static unsigned int lines = 10;
static unsigned int columns = 1;
static int min_width = 10;
#endif

static const char *fonts[] = { "CozetteVector:size=15:style=Medium" };
static const char *prompt  = "exec:";
static const char *colors[][2] = {
    /*                 fg          bg    */
	[SchemeNorm] = { "#D8DEE9", "#1D1F21" },
	[SchemeSel]  = { "#1D1F21", "#D8DEE9" },
	[SchemeOut]  = { "#FAC863", "#1D1F21" },

    #if BORDER_PATCH
	[SchemeBorder] = { "#1D1F21", "#D8DEE9" },
    #endif

    #if FUZZYHIGHLIGHT_PATCH
	[SchemeSelHighlight]  = { "#D8DEE9", "#1D1F21" },
	[SchemeNormHighlight] = { "#FAC863", "#1D1F21" },
    #endif
};
static const char worddelimiters[] = " /?\"&[]";
