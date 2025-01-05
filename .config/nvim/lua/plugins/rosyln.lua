return {
  "seblj/roslyn.nvim",
  ft = "cs",
  opts = {
    exe = {
      "dotnet",
      vim.fs.joinpath("/home/sverre/.local/share", "roslyn", "Microsoft.CodeAnalysis.LanguageServer.dll"),
    },
    config = {
      settings = {
        ["csharp|background_analysis"] = {
          dotnet_analyzer_diagnostics_scope = "fullSolution",
          dotnet_compiler_diagnostics_scope = "fullSolution",
        },
        ["csharp|code_lens"] = {
          dotnet_enable_references_code_lens = false,
        },
        ["csharp|completion"] = {
          dotnet_show_completion_items_from_unimported_namespaces = true,
        },
        ["csharp|inlay_hints"] = {
          csharp_enable_inlay_hints_for_implicit_object_creation = false,
          csharp_enable_inlay_hints_for_implicit_variable_types = false,
          csharp_enable_inlay_hints_for_lambda_parameter_types = false,
          csharp_enable_inlay_hints_for_types = false,
          dotnet_enable_inlay_hints_for_indexer_parameters = false,
          dotnet_enable_inlay_hints_for_literal_parameters = false,
          dotnet_enable_inlay_hints_for_object_creation_parameters = false,
          dotnet_enable_inlay_hints_for_other_parameters = false,
          dotnet_enable_inlay_hints_for_parameters = false,
          dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
        },
      },
    },
    -- your configuration comes here; leave empty for default settings
  },
}
