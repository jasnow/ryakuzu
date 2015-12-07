module Ryakuzu
  class TablesController < ApplicationController
    respond_to :js

    def create
      Ryakuzu::MigrationService.new(params[:table]).call
      redirect_to :back
    end

    def column
      @column = params[:column]
      @table  = params[:table]
      @opts   = Ryakuzu::ColumnInfo.new.call(@table, @column)
      respond_with @opts
    end

    def column_options
      Ryakuzu::ColumnDefaultService.new(params[:column_defaults]).call
      redirect_to :back
    end

    def remove_column
      Ryakuzu::RemoveService.new(table: params[:table], column: params[:column]).call
      redirect_to :back
    end

    def remove_table
      result = Ryakuzu::RemoveService.new(table: params[:table]).call
      redirect_to :back, notice: result
    end

    def add_column_form
      @table = params[:table]
      respond_with @table
    end

    def add_column
      table   = params[:table]
      column  = params[:name]['column']
      type    = params[:type]
      Ryakuzu::AddColumnService.new(table, column, type).call
      redirect_to :back
    end
  end
end
